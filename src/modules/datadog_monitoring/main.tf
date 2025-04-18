resource "helm_release" "datadog" {
  name       = "datadog"
  namespace  = "datadog"
  repository = "https://helm.datadoghq.com"
  chart      = "datadog"
  version    = "3.50.0"
  create_namespace = true

  set {
    name  = "datadog.apiKey"
    value = var.datadog_api_key
  }

  set {
    name  = "datadog.site"
    value = "datadoghq.com"
  }

  set {
    name  = "datadog.logs.enabled"
    value = "true"
  }

  set {
    name  = "datadog.apm.enabled"
    value = "true"
  }

  set {
    name  = "datadog.processAgent.enabled"
    value = "true"
  }

  set {
    name  = "datadog.kubeStateMetricsEnabled"
    value = "true"
  }

  set {
    name  = "datadog.leaderElection"
    value = "true"
  }

  set {
    name  = "agents.useHostNetwork"
    value = "true"
  }

  set {
    name  = "clusterName"
    value = var.cluster_name
  }
}
