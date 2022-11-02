Argocd-test
===========

Bitnami
-------

    helm repo add bitnami https://charts.bitnami.com/bitnami
    helm install my-release bitnami/argo-cd

## Use values to modify image tag

    helm install my-release bitnami/argo-cd -f values.yaml

IMPORTANTE: il value deve essere in formato yaml. Nella documentazione si presuppone un applicazione a riga di comando.

1. Access your Argo CD installation:
  Execute the following commands:

  kubectl port-forward --namespace argocd svc/argocd-server 8080:80 &

2. Execute the following commands to obtain the Argo CD credentials:

  echo "Username: \"admin\""
  echo "Password: $(kubectl -n argocd get secret argocd-initial-admin-secret -o jsonpath="{.data.clearPassword}" | base64 -d)"


## Step to test

    kc apply -f crd-201.yaml

Install with different tool: not using helm
----------------------------------------------------

    https://github.com/argoproj/argo-cd/releases/tag/v2.0.1

## Get password
    echo "Username: \"admin\""
    echo "Password: $(kubectl -n argocd get secret argocd-initial-admin-secret -o jsonpath="{.data.password}" | base64 -d)"

Reference
---------

## application yaml part

    https://argo-cd.readthedocs.io/en/stable/operator-manual/declarative-setup/

## install new repo

    argocd repo add https://github.com/attiferosisal/argocd-test-private.git --username ... --password ...

Export
------

    argocd admin export > backup.yaml
    argocd admin import - < backup.yaml

Add OCI helm repo
------------------

It's impossible to add with UI, you must add the repo with the command line tool (CFR. https://stackoverflow.com/questions/68219458/connecting-an-app-in-argocd-to-use-a-helm-oci-repository)

    argocd repo add iad.ocir.io --type helm --name helm-oci-test --enable-oci --username  sisalspa/oracleidentitycloudservice/attilio.ferraccio@sisal.it --password bxk7:OfZr9eqC0QSn-Q1

Create application
------------------
ie.
    project: default
    source:
        repoURL: iad.ocir.io
        targetRevision: 0.1.x
        chart: sisalspa/helmtest/helmstreet
    destination:
        server: 'https://kubernetes.default.svc'
        namespace: helmstreet
    syncPolicy:
        automated:
            prune: true