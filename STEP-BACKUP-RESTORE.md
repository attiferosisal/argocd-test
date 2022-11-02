Requiremet
----------

- helm client
- argocd client
- kubectl
- kubeconfig for referenced cluster

Steps
-----

### Connect to source ArgoCD

- kubectl port-forward --namespace argocd svc/argocd-server 8080:443
- argocd-2.2.15-linux-amd64 login localhost:8080 --insecure --plaintext

### Export ArgoCD config

- argocd-2.2.15-linux-amd64 admin export > backup_25102022.yaml

### Install bitnami argocd repo

- helm-3.10.1-linux-amd64 repo add bitnami https://charts.bitnami.com/bitnami

### Configure new ArgoCD

- kubectl create namespace argocd-2-4-14
- Change namespace to argocd-2-4-14
- helm-3.10.1-linux-amd64 install release-2-4 bitnami/argo-cd 

#### System Out

    NAME: release-2-4-14
    LAST DEPLOYED: Tue Oct 25 09:39:02 2022
    NAMESPACE: argocd-2-4-14
    STATUS: deployed
    REVISION: 1
    TEST SUITE: None
    NOTES:
    CHART NAME: argo-cd
    CHART VERSION: 4.2.5
    APP VERSION: 2.4.15

    ** Please be patient while the chart is being deployed **

    1. Access your Argo CD installation:
    Execute the following commands:

    kubectl port-forward --namespace argocd-2-4-14 svc/release-2-4-14-argo-cd-server 8080:80 &
    export URL=http://127.0.0.1:8080/
    echo "Argo CD URL: http://127.0.0.1:8080/"

    2. Execute the following commands to obtain the Argo CD credentials:

    echo "Username: \"admin\""
    echo "Password: $(kubectl -n argocd-2-4 get secret argocd-secret -o jsonpath="{.data.clearPassword}" | base64 -d)"
    [root@csrvkmarc01 argocd-2.0.1-backup]# 

### Connect to destination ArgoCD

- kubectl port-forward --namespace argocd svc/argocd-server 8080:443
- argocd-2.2.15-linux-amd64 login localhost:8080 --insecure --plaintext
- argocd-2.2.15-linux-amd64 admin import - < backup.yaml