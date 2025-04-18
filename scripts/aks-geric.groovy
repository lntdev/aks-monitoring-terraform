def outputYaml // need global variable to pass between nodes
def executorContainerName // setup a property to store the name of the planned to be executor container within YAML
def workflowGitBranch = scm.branches[0].name
 //Load the helpful-functions script
//def helpfulFunctions = load 'helper-scripts/helpful-functions.groovy'

node('deploy') { // this node can be whatever as long as linux and git

    checkout([$class: 'GitSCM', branches: [[name: 'master]], extensions: [], gitTool: 'Default',
              userRemoteConfigs: [[credentialsId: 'xxxxx-5ba5ac3e6277', url: 'git@github.com:Tool/workflow.git']]])

    //Load the helpful-functions script
    def helpfulFunctions = load 'helper-scripts/helpful-functions.groovy'

    def inputYaml = readYaml file: 'k8s-templates/test_connection.yaml' // this imports YAML into a Map form

    echo "${inputYaml}" // see it shown as a map

    executorContainerName = inputYaml.spec.containers[1].name // store the name of our executor container

    // Call the genericWrappers method from the loaded script
    def buildProps = [:] // Set up any build properties you need
    int cleanDockerContainer = 1 // Set the value based on your requirement
    int cpus = 4 // Set the value based on your requirement
    int memoryInGB = 16 // Set the value based on your requirement
    boolean fips = false // Set the value based on your requirement

//    helpfulFunctions.genericWrappers(buildProps, cleanDockerContainer) {
//        // Your existing code or additional steps go here
//    }

    // Add CPU, memory, and FIPS information to the pod YAML
    inputYaml.spec.containers.each { container ->
        if (container.name == executorContainerName) {
            container.resources = [:] // Clear existing resources (if any)
            container.resources.requests = [:]
            container.resources.requests['cpu'] = "${cpus}m"
            container.resources.requests['memory'] = "${memoryInGB}Gi"
        }
    }

    outputYaml = writeYaml data: inputYaml, returnText: true
}

echo "Pod Template YAML : " + outputYaml

podTemplate(yaml: outputYaml) {  // pass to the K8s plugin our desired pod template

    node(POD_LABEL) {
        container('leap') {
            echo POD_CONTAINER // displays 'busy box'
            sh 'hostname'
            echo 'Hello world!! The Kubernetes cluster seems to be working'
        }
    }
}
