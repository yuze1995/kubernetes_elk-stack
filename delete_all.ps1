
$SUBSCRIPTION = "2019_MPN06-2"
$RESOURCE_GROUP = "elk-aks"

# AZURE LOGIN
az login

# Set SUBSCRIPTION
az account set --subscription $SUBSCRIPTION

#Create aks cluster
az group delete --name $RESOURCE_GROUP --subscription $SUBSCRIPTION