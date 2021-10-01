
$SUBSCRIPTION = "2019_MPN06-1"
$RESOURCE_GROUP = "elk-aks"
$ACR_NAME = "elktest"
$ACR_REGISTRY = "elktest.azurecr.io"

az acr login `
  --subscription $SUBSCRIPTION `
  --name $ACR_REGISTRY

docker build -t elktest.azurecr.io/logstash/plugin:7.13.4 ..

docker push elktest.azurecr.io/logstash/plugin:7.13.4