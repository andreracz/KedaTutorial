$resouceGroupName="tutorial-kube"
$aksName="tutorial-kube-aks"

kubectl config unset clusters.$aksName
kubectl config unset contexts.$aksName
kubectl config unset users.clusterUser_"$resouceGroupName"_"$aksName"
az group delete --name $resouceGroupName

