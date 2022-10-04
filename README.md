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

    helm install my-release bitnami/argo-cd -f values.yaml

IMPORTANTE: il value deve essere in formato yaml. Nella documentazione si presuppone un applicazione a riga di comando.

1. Access your Argo CD installation:
  Execute the following commands:

  kubectl port-forward --namespace default svc/my-release-argo-cd-server 8080:80 &

2. Execute the following commands to obtain the Argo CD credentials:

  echo "Username: \"admin\""
  echo "Password: $(kubectl -n default get secret argocd-secret -o jsonpath="{.data.clearPassword}" | base64 -d)"


## Step to test

    kc apply -f crd-201.yaml
    

## Update to new version
TBD

Install with different helm and upgrade with bitnami
----------------------------------------------------

    https://github.com/argoproj/argo-cd/releases/tag/v2.0.1

## Get password
    echo "Username: \"admin\""
    echo "Password: $(kubectl -n argocd get secret argocd-initial-admin-secret -o jsonpath="{.data.password}" | base64 -d)"

Reference
---------

## application yaml part

    https://argo-cd.readthedocs.io/en/stable/operator-manual/declarative-setup/
