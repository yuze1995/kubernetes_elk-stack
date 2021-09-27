
$SUBSCRIPTION = "2019_MPN06-1"
$LOCATION = "eastasia"
$RESOURCE_GROUP = "elk-aks"
$ELK_STORAGE = "elktempstorage"
$ACR_NAME = "elktest"
$ACR_SKU = "Basic"

# AZURE LOGIN
az login

# Set SUBSCRIPTION
az account set --subscription $SUBSCRIPTION

# Create resource group
az group create --location $LOCATION --name $RESOURCE_GROUP

# Create Storage Account
az storage account create  `
  --name $ELK_STORAGE `
  --resource-group $RESOURCE_GROUP `
  --location $LOCATION `
  --sku Standard_LRS `
  --kind StorageV2

# Create ACR
az acr create `
  --resource-group $RESOURCE_GROUP `
  --name $ACR_NAME `
  --sku $ACR_SKU `
  --location $LOCATION `
  --public-network-enabled true 