#!/bin/bash

sed 's/"namespace":"argocd"/"namespace":"argocd-2-4"/g' backup_25102022.yaml > backup_25102022_replaced.yaml

sed 's/namespace: argocd/namespace: argocd-2-4/g' backup_25102022_replaced.yaml > backup_25102022_final.yaml