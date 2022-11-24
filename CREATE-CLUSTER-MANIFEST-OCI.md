Create cluster manifest for OCI
===============================

Manifest cluster example
------------------------

    apiVersion: v1
    data:
    config: eyJiZWFyZXJUb2tlbiI6ImV5Smhi...
    name: Y29udGV4dC1kZXN0aW5hdGlvbg==
    server: aHR0cHM6Ly8xMjkuMTUzLjE2OS4zNDo2NDQz
    kind: Secret
    metadata:
    labels:
        argocd.argoproj.io/secret-type: cluster
    name: cluster-129.153.169.34-506638175
    namespace: argocd-2-4
    type: Opaque

Manifest cluster config example
-------------------------------

The parameter config in argocd cluster manifest is in base64. If you decode you have to see something like this

    {
        "execProviderConfig": {
            "command": "oci",
            "args": ["ce", "cluster", "generate-token", "--cluster-id", "ocid1.cluster.oc1.iad.aaaaaaaaxrmcjz2u4gcmw53bmihumh4o52kuh5nnyq4qa5p6ccr5gwl4ojhq", "--region", "us-ashburn-1"],
            "env": {},
            "apiVersion": "client.authentication.k8s.io/v1beta1"
        },
        "tlsClientConfig": {
            "insecure": false,
            "caData": "LS0tLS1CRUdJTiBDRV..."
        }
    }

Normally we expect "bearerToken" instead of execProviderConfig. This part contain the oci command to find authentication token.

To use this you must provide:
-  A configmap with oci config file
-  A configmap for public and private key