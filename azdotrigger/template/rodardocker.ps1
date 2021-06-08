docker build -t meuacrunico.azurecr.io/azdo-template .
docker run -it -e AZDO_URL=$env:AZDO_URL -e AZDO-TOKEN=$env:AZDO_PAT meuacrunico.azurecr.io/azdo-template azdotemplate