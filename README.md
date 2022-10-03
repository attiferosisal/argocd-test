Argocd-test
===========


Umbrella chart
---------------

## Generate chart.lock

helm repo add argo-cd https://argoproj.github.io/argo-helm
helm dep update charts/argo-cd/

## Install charts
helm install argo-cd charts/argo-cd/

Bitnami
-------

    helm repo add bitnami https://charts.bitnami.com/bitnami
    helm install my-release bitnami/argo-cd

## Use values to modify image tag

    helm install my-release bitnami/argo-cd -f valuse.yaml

IMPORTANTE: il value deve essere in formato json. Nella documentazione si presuppone un applicazione a riga di comando.

## Update to new version
TBD

Install with different helm and upgrade with bitnami
----------------------------------------------------

TBD