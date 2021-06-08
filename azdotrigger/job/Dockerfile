FROM ubuntu:18.04

# To make it easier for build and release pipelines to run apt-get,
# configure apt to not require confirmation (assume the -y argument by default)
ENV DEBIAN_FRONTEND=noninteractive
RUN echo "APT::Get::Assume-Yes \"true\";" > /etc/apt/apt.conf.d/90assumeyes

# Atualiza as ferramentas e instala dependencias
RUN apt-get update \
&& apt-get install -y --no-install-recommends \
        ca-certificates \
        curl \
        jq \
        git \
        iputils-ping \
        libcurl4 \
        libicu60 \
        libunwind8 \
        netcat \
        libssl1.0 \
		apt-transport-https \
		gnupg \
		lsb-release

# Instala o Docker (para compilar containers)
RUN curl -fsSL https://download.docker.com/linux/ubuntu/gpg | gpg --dearmor -o /usr/share/keyrings/docker-archive-keyring.gpg

RUN echo \
  "deb [arch=amd64 signed-by=/usr/share/keyrings/docker-archive-keyring.gpg] https://download.docker.com/linux/ubuntu \
  $(lsb_release -cs) stable" | tee /etc/apt/sources.list.d/docker.list > /dev/null

RUN apt-get update \
&&  apt-get install docker-ce docker-ce-cli containerd.io

# Instala o Azure CLI (para conectar na Azure)
RUN curl -sL https://aka.ms/InstallAzureCLIDeb | bash

# Instala o Kubectl (cli kubernetes)
RUN curl -LO https://dl.k8s.io/release/v1.19.7/bin/linux/amd64/kubectl
RUN chmod +x ./kubectl
RUN mv ./kubectl /usr/local/bin

# Instala o Helm (Package Manager Kubernetes)
RUN curl -fsSL -o get_helm.sh https://raw.githubusercontent.com/helm/helm/master/scripts/get-helm-3
RUN chmod +x get_helm.sh
RUN ./get_helm.sh --no-sudo

#Instala o NodeJS

RUN curl -fsSL https://deb.nodesource.com/setup_14.x | bash
RUN apt-get install -y nodejs

WORKDIR /azp

# Copia a SH do AZDO Agent
COPY ./start.sh .
RUN chmod +x start.sh

# Inicia AZDO Agent
CMD ["./start.sh"]
