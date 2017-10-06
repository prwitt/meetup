# Define environment information
RESOURCE_GROUP=rg-acs-meetup
LOCATION=westus
ORCHESTRATOR=kubernetes
DNS_PREFIX=acs-meetup
CLUSTER_NAME=acs-meetup
KEY="/home/{your-user}/clouddrive/.ssh/id_rsa.pub"
PKEY="/home/{your-user}/clouddrive/.ssh/id_rsa"

# Create Resource Group
az group create --name=$RESOURCE_GROUP --location=$LOCATION

# Create Cluster
az acs create --orchestrator-type=$ORCHESTRATOR --resource-group=$RESOURCE_GROUP --name=$CLUSTER_NAME --dns-prefix=$DNS_PREFIX --ssh-key-value=$KEY --agent-count 1

## Add the master Kubernetes cluster configuration to ~/.kube/config 
az acs kubernetes get-credentials --resource-group=$RESOURCE_GROUP --name=$CLUSTER_NAME --ssh-key-file=$PKEY