FROM bitnami/argo-cd:2.4.13

LABEL maintainer="Attilio Ferraccio" \
      date_create="10/10/2022" \
      version="0.0.1" \
      description="Custom bitnami argocd with oci client installed" 

# References:
#  https://argoproj.github.io/argo-cd/operator-manual/secret-management/
#  https://faun.pub/handling-kubernetes-secrets-with-argocd-and-sops-650df91de173
#  https://rtfm.co.ua/en/argocd-a-helm-chart-deployment-and-working-with-helm-secrets-via-aws-kms/
#  https://argoproj.github.io/argo-cd/user-guide/helm/#helm-plugins
#  https://hackernoon.com/how-to-handle-kubernetes-secrets-with-argocd-and-sops-r92d3wt1
#  https://github.com/argoproj/argo-cd/issues/1364
#  https://gitlab.com/ittennull/sopshelm
#  https://github.com/camptocamp/docker-argocd

#---------------------------------#
# Variables
#---------------------------------#
# Environment variables (the value is changed at container startup or build image, if empty, it will be given a default value)

#ARG AWS_KMS_ARN
#ENV AWS_KMS_ARN ${AWS_KMS_ARN:-'arn:aws:kms:us-east-2:255686512659:key/d38c3af4-e577-4634-81b2-26a54a7ba9b6'}

#ARG AWS_PROFILE
#ENV AWS_PROFILE ${AWS_PROFILE:-'default'}

#ENV SOPS_VERSION="v3.7.1" \
#    HELM_SECRETS_VERSION="v3.13.0" \
#    HELM_DIFF_VERSION="v3.4.1" \
#    SOPS_CREDENTIALS_FILE='/home/argocd/.sops.yaml'
#-------- End - Variables --------#

USER root

#COPY helm-wrapper.sh /usr/local/bin/

RUN apt-get update \
    && apt-get install -y curl \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/* 

# Install sops
RUN curl https://raw.githubusercontent.com/oracle/oci-cli/master/scripts/install/install.sh -o /tmp/install.sh \
    && chmod +x /tmp/install.sh

RUN yes | /tmp/install.sh

#    && sops --version

# helm secrets plugin should be installed as user argocd (999) or it won't be found
# Reference: https://github.com/argoproj/argo-cd/blob/master/Dockerfile
#USER 999y

#RUN /usr/local/bin/helm.bin plugin install https://github.com/jkroepke/helm-secrets --version ${HELM_SECRETS_VERSION} \
#    && /usr/local/bin/helm.bin plugin install https://github.com/databus23/helm-diff --version ${HELM_DIFF_VERSION}

#ENV HELM_PLUGINS="/home/argocd/.local/share/helm/plugins/"


# docker build -t customize-argov4 .
# docker run --rm -it --entrypoint bash customize-argov3