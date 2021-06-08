KEDA Tutorial
=============

Este é um tutorial de como usar o [KEDA - Kubernetes Event Driven Autoscaler](https://keda.sh)

Pré-Requisitos
--------------

Para rodar este exemplo, é necessário:

1. Ter uma conta no Azure, com créditos disponíveis (a opção de [trial](https://azure.microsoft.com/pt-br/free/) gratuito funciona!)
2. Ter o [Azure Cli](https://docs.microsoft.com/pt-br/cli/azure/install-azure-cli?view=azure-cli-latest) instalado
3. Estar com o Azure cli logado na conta que deve ser utilizado e utilizando a subscription correta
4. Ter o [kubectl](https://kubernetes.io/docs/tasks/tools/install-kubectl/) instalado
5. Ter o [helm](https://helm.sh) instalado
6. Recomendo a utilização do Visual Studio Code para codificação!


Provisionar Serviços em Nuvem:

1. Disponibilizei um script que provisiona:
    - Azure Kubernetes Services
    - Azure Contaner Registry
    - Azure Service Bus
2. Crie uma variável de ambiente AZDO_PAT com um Personal Access Token no Azure Devops, para poder acessar os pipelines, e outra com o nome AZDO_URL com a URL da organização do Azure Devops (sem a / no final).
3. Para rodar, estando logado na subscription que ser deseja usar, modifique os nomes das variáveis no início do script e rode ele. 
4. O Script irá criar os serviços, logar no AKS e ACR, criar os namespaces a serem utilizados, fazer o login no ACR e AKS.
5. Além disso, ele cria os namespaces para os testes e cria os secrets para conexão com Azure Devops e Azure Service Bus.

Exemplos:
---------

Temos nesse repositório, 2 exemplos do uso do KEDA:

1. [Trigger do Azure Service Bus](servicebustrigger/README.md)
2. [Azure Devops Pipeline Trigger](azdotrigger/README.md)


Limpeza:
--------

Para limpar o ambiente (excluir os recursos no Azure e limpar o contexto do AKS), rode o comando: ```limpar-infra.ps1```