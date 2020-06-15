# Folding@home on Photon
This repository provides VMware Photon based Folding@home client to run on container engines.
## Deploy on Docker
```Docker
docker run -d -e FAH_USER=Masashi_Teruya -e FAH_PASSKEY=************************* -e FAH_TEAM=52737 teruya/photon-fah
```
## Deploy on Kubernetes
```Create secret
kubectl create secret generic fah --from-literal=*************************
```
```Create deployment and configmap
apiVersion: apps/v1
kind: Deployment
metadata:
  name: fah
  labels:
    app: fah
spec:
  selector:
    matchLabels:
      name: fah
  replicas: 8
  template:
    metadata:
      labels:
        name: fah
    spec:
      containers:
      - name: fah
        image: teruya/photon-fah
        env:
          - name: FAH_USER
            valueFrom:
              configMapKeyRef:
                name: fah
                key: user
          - name: FAH_TEAM
            valueFrom:
                configMapKeyRef:
                  name: fah
                  key: team
          - name: FAH_PASSKEY
            valueFrom:
                secretKeyRef:
                  name: fah
                  key: passkey
      terminationGracePeriodSeconds: 60
---
apiVersion: v1
kind: ConfigMap
metadata:
  name: fah
data:
  user: Masashi_Teruya
  team: "52737"
```
