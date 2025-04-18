#!/bin/bash

tfv=1.4.6  # Change this version as necessary

distro=$(cat /etc/*-release | grep NAME)

debflag=$(echo $distro | grep -i "ubuntu")
if [ -z "$debflag" ]
then   # If it is not Ubuntu, test if it is Debian.
  debflag=$(echo $distro | grep -i "debian")
  echo "determining Linux distribution..."
else
   echo "You have Ubuntu Linux!"
fi

rhflag=$(echo $distro | grep -i "red*hat")
if [ -z "$rhflag" ]
then   #If it is not RedHat, see if it is CentOS or Fedora.
  rhflag=$(echo $distro | grep -i "centos")
  if [ -z "$rhflag" ]
    then    #If it is neither RedHat nor CentOS, see if it is Fedora.
    echo "It does not appear to be CentOS or RHEL..."
    rhflag=$(echo $distro | grep -i "fedora")
    fi
fi

if [ -z "$rhflag" ]
  then
  echo "...still determining Linux distribution..."
else
  echo "You have a RedHat distribution (e.g., CentOS, RHEL, or Fedora)"
  yum -y install unzip
fi

if [ -z "$debflag" ]
then
  echo "...still determining Linux distribution..."
else
   echo "You are using either Ubuntu Linux or Debian Linux."
   apt-get -y install unzip  # necessary for Azure Ubuntu Linux distros. May not be needed with typical AWS AMIs.
   fi

suseflag=$(echo $distro | grep -i "suse")
if [ -z "$suseflag" ]
then
  if [ -z "$debflag" ]
  then
    if [ -z "$rhflag" ]
      then
      echo "*******************************************"
      echo "Could not determine the Linux distribution!"
      echo "Installation aborted. Nothing was done."
      echo "******************************************"
      exit
    fi
  fi
else
   echo "You have Linux SUSE."
   zypper -n install unzip
fi

cd /tmp
tflink='https://releases.hashicorp.com/terraform/'$tfv'/terraform_'$tfv'_linux_amd64.zip'
destiny='terraform_'$tfv'_linux_amd64.zip'
curl $tflink > $destiny
unzip $destiny
mv /tmp/terraform /usr/local/bin
echo "Run 'terraform --version' manually to verify it is correctly installed."

