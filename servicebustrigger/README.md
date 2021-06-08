Service Bus Trigger
===================

Esse exemplo mostra como usar o Azure Service Bus como trigger para o KEDA.

Ele assume que você já criou a infra, conforme os pré-requisitos do README inicial.

Para deployar: 
1. Instale o TriggerAuth para prover a autenticação do ServiceBus: ```kubectl apply -n servicebus -f triggerauth.yaml```
2. Instale o ScaledObject para prover as regras de autoscale: ```kubectl apply -n servicebus -f scaledobject.yaml```


Foram disponbilizados dois deployments para que voce possa ver o comportamento do KEDA:
1. Deployment com container que não remove as mensagens da fila, para ver como ele escala: ```kubectl apply -n servicebus -f deployment.yaml```
2. Deployment com container que processa a fila: 
    1. Entre no diretório: ```cd processor```
    2. Construa a imagem do docker: ```builddocker.ps1```
    3. Faça o deploy: ```kubectl apply -n servicebus -f deployment.yaml```

Para testar, foi disponilibizado um script que envia mensagens para o servicebus:
    1. Entre no diretório: ```cd processor```
    2. Instale as dependencias: ```npm i```
    2. Rode o comando: ```node sender.js 10``` - Envia 10 mensagens

