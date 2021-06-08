$resouceGroupName="tutorial-kube"
$aksName="tutorial-kube-aks"

az group create delete --name $resouceGroupName
kubectl config unset clusters.$aksName
kubectl config unset contexts.$aksName
kubectl config unset users.clusterUser_"$resouceGroupName"_"$aksName"
