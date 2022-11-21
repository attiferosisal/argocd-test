Requiremet
----------

- helm client
- argocd client 2.4
- kubectl
- kubeconfig for referenced cluster

Steps
-----

### Connect to ArgoCD - first solution ArcoCD API

- echo "Password: $(kubectl -n argocd get secret argocd-initial-admin-secret -o jsonpath="{.data.password}" | base64 -d)"
- kubectl port-forward --namespace argocd svc/argocd-server 8080:80
- argocd login localhost:8080 --insecure --plaintext

### Connect to ArgoCD - second solution ArgoCD throw kubecontext

- argocd login --core true --kube-context argocd

### Export ArgoCD config

- argocd admin export > backup_17112022.yaml

### Patch backup

To patch the backup use bash scritp replace.sh

### Install bitnami argocd repo

- helm-3.10.1-linux-amd64 repo add bitnami https://charts.bitnami.com/bitnami

### Install new ArgoCD

- kubectl create namespace argocd-2-4
- Change namespace to argocd-2-4
- helm-3.10.1-linux-amd64 install release-2-4 bitnami/argo-cd --version 4.3.0 -f valuesfile.yaml

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

### Pathc backup with new namespace

    TBD

### Connect to destination ArgoCD

- kubectl port-forward --namespace argocd svc/argocd-server 8080:443
- argocd login localhost:8080 --insecure --plaintext
- argocd admin import - < backup.yaml

### Insert url in argocd-cm if not inserted throw helm

Under data section insert:

    url: https://argocd-automation-platform-preprod.sisal.it

### Create rbac argo file if not created
