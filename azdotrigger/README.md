Azure Pipeline Trigger
======================

Esse exemplo mostra como escalar trabalhos de CI/CD com o Azure Devops com o o KEDA.

Ele assume que você já criou a infra, conforme os pré-requisitos do README inicial.

O Azure Devops tem uma limitação e a pool precisa ter pelo menos 1 agent registrado, mesmo que offline, para que ele saiba as capacidades daquele agent. Sem isso, os builds falham.

Foi feita uma modificação no script de inicialização padrão do Azure Devops, para receber um parametro adicional, ONLY_REGISTER, que só efetua o registro do Agent, dessa forma "enganamos" o Azure Devops a pensar que a pool tem sempre um Agent offline.

Para rodar o template e compilar o Docker: 
1. Mude para o diretorio do template: ```cd template```
2. Rode o docker ```rodardocker.ps1```
3. Verifique que a sua pool tem um agent registrado e se o docker do agent foi publicado.

O Trigger do Azure Pipelines usar o ID da Pool de Workers como parametro e não seu nome. Para obter, acesse a URL: https://dev.azure.com/{organizationName}/_apis/distributedtask/pools?poolname={agentPoolName}

Para rodar os worker como job
1. Instale o TriggerAuth para prover a autenticação do Azure Devops: ```kubectl apply -n azdo -f triggerauth.yaml```
2. Entre no diretório: ```cd job```
3. Altere o yaml agent-job.yaml, modificando o poolID.
4. Faça o deploy: ```kubectl apply -n azdo -f agent-job.yaml```

Para testar, crie um pipeline que use essa pool de workers e rode ele

