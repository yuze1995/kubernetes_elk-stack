
$SUBSCRIPTION = "2019_MPN06-2"
$LOCATION = "eastasia"
$RESOURCE_GROUP = "elk-aks"
$AKS_CLUSTER_NAME = "elk-aks-cluster"
$AKS_CLUSTER_VM_SIZE = "Standard_A4_v2"
$AKS_CLUSTER_NODE = "1"
$AKS_NAMESPACE = "elk"

<# 
az account list-locations -o table 
az vm list-sizes --location $LOCATION -o table 
#>

# AZURE LOGIN
az login

# Set SUBSCRIPTION
az account set --subscription $SUBSCRIPTION

# Create resource group
az group create --location $LOCATION --name $RESOURCE_GROUP

#Create aks cluster
az aks create `
  --resource-group $RESOURCE_GROUP `
  --location $LOCATION `
  --name $AKS_CLUSTER_NAME `
  --node-vm-size=$AKS_CLUSTER_VM_SIZE `
  --node-count $AKS_CLUSTER_NODE `
  --generate-ssh-keys `
  --enable-addons http_application_routing    # Enable Ingress Service
#  --enable-azure-rbac `
#  --enable-aad `

# Get AKS Cluster Credentials
az aks get-credentials `
  --resource-group $RESOURCE_GROUP `
  --name $AKS_CLUSTER_NAME

# List Kubernetes Node
# kubectl get nodes -o wide 
# kubectl get nodes --show-labels

# Create AZURE Kubernetes NAMESPACE
kubectl create namespace $AKS_NAMESPACE 

#########  1 - Storage  #########

# Create Disk
# kubectl create -f storage-disk.yml 

# Create Secret - Storage Account (Update File secret-storage-account.yml)
# kubectl create -f secret-storage-account.yml
