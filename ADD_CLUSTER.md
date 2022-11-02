Add cluster
===========

argocd cli
----------

    argocd cluster add <destination cluster>

We can have an error if we can't login so we have to do the login

    argocd login localhost:8080 --username admin --passowrd KPHdHpYrrDPjVlsd

Viene creato un ServiceAccount argocd-manager

    kc get sa -n kube-system argocd-manager -o yaml

e il certificato viene condiviso in una secret nel kube dove risiede argo

    kc get secret cluster-129.153.169.34-506638175 -o yaml