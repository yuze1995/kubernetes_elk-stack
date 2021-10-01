
$SUBSCRIPTION = "2019_MPN06-1"
$LOCATION = "eastasia"
$RESOURCE_GROUP = "elk-aks"
$AKS_CLUSTER_NAME = "elk-aks-cluster"
$AKS_CLUSTER_VM_SIZE = "Standard_A4_v2"
$AKS_CLUSTER_NODE = "1"
$AKS_NAMESPACE = "elk"
$ACR_NAME = "elktest"

<# 
az account list-locations -o table 
az vm list-sizes --location $LOCATION -o table 
#>

# AZURE LOGIN
az login

# Set SUBSCRIPTION
az account set --subscription $SUBSCRIPTION

#Create aks cluster
az aks create `
  --resource-group $RESOURCE_GROUP `
  --location $LOCATION `
  --name $AKS_CLUSTER_NAME `
  --node-vm-size=$AKS_CLUSTER_VM_SIZE `
  --node-count $AKS_CLUSTER_NODE `
  --generate-ssh-keys `
  --attach-acr $ACR_NAME  `
  --network-plugin azure `
  --network-policy calico `
  --yes `
  --enable-addons http_application_routing   # Enable Ingress Service
  # --kubernetes-version 1.21.2 `
  # --enable-aad `
  # --enable-azure-rbac `

# # Get AKS Cluster Credentials
az aks get-credentials `
  --resource-group $RESOURCE_GROUP `
  --name $AKS_CLUSTER_NAME

# List Kubernetes Node
# kubectl get nodes -o wide 
# kubectl get nodes --show-labels