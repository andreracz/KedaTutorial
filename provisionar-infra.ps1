$acrName="meuacrunico"
$resouceGroupName="tutorial-kube"
$aksName="tutorial-kube-aks"
$sbName="kedatest1"
$queueName="kedatest"

az group create --location eastus --name $resouceGroupName
az acr create -g $resouceGroupName --name $acrName --sku basic
az aks create -g $resouceGroupName --name $aksName --node-count 1 --attach-acr $acrName --generate-ssh-keys
az aks get-credentials -g $resouceGroupName --name $aksName --overwrite-existing
az acr login --name $acrName
kubectl create namespace keda
helm repo update
helm install keda kedacore/keda --namespace keda
az servicebus namespace create --resource-group $resouceGroupName --name $sbName --location eastus
az servicebus queue create --resource-group $resouceGroupName --namespace-name $sbName --name $queueName
$env:SB_CONNECTION_STRING=az servicebus namespace authorization-rule keys list --resource-group $resouceGroupName --namespace-name $sbName --name RootManageSharedAccessKey --query primaryConnectionString --output tsv
$env:SB_CONNECTION_STRING
$env:SB_QUEUE_NAME=$queueName
kubectl create namespace servicebus
kubectl create secret generic -n servicebus servicebusconnection --from-literal="connectionstring=$env:SB_CONNECTION_STRING"
kubectl create namespace azdo
kubectl create secret generic -n azdo azdo-secret --from-literal="token=$env:AZDO_PAT" --from-literal="url=$env:AZDO_URL" --from-literal="pool=$env:AZDO_POOL"
