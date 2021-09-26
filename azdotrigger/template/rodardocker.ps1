docker build -t meuacrunico.azurecr.io/azdo-agent .
docker push meuacrunico.azurecr.io/azdo-agent
docker run -it --rm -e AZP_URL=$env:AZDO_URL -e AZP_TOKEN=$env:AZDO_PAT -e AZP_POOL=$env:AZDO_POOL -e ONLY_REGISTER=true meuacrunico.azurecr.io/azdo-agent