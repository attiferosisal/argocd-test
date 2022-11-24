ARG BASE_IMAGE="bitnami/argo-cd:2.4.11-debian-11-r5"

FROM ${BASE_IMAGE} AS base

#ARG OCI_LOGAN_VERSION="2.0.3"

USER root
#RUN apt update && apt upgrade -y; apt -y install software-properties-common; add-apt-repository ppa:deadsnakes/ppa; apt-get update; apt-get -y install python3.8
RUN apt update && apt upgrade -y; apt -y install python3 python3-pip; pip install oci-cli
#RUN curl -L https://raw.githubusercontent.com/oracle/oci-cli/master/scripts/install/install.sh -o /tmp/install.sh
#RUN mkdir -p .cache/pip; chmod 777 .cache/pip
#RUN /tmp/install.sh

USER 1001