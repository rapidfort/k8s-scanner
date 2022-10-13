# k8s-scanner

<b> k8s-scanner scans all images in k8s cluster with RapidFort rf-scan tool </b>

## Usage

#### Installing k8s-scanner, ensure you have RF_ACCESS_ID and RF_SECRET_ACCESS_KEY in env
```bash
helm upgrade --install rel1 k8s-scanner \
    --set secret.rf_access_id=$RF_ACCESS_ID \
    --set secret.rf_secret_access_key=$RF_SECRET_ACCESS_KEY \
Release "rel1" does not exist. Installing it now.
NAME: rel1
LAST DEPLOYED: Thu Jun 30 15:47:55 2022
NAMESPACE: default
STATUS: deployed
REVISION: 1
TEST SUITE: None
NOTES:
1. If you want to create a run now, please run below command

kubectl create job --from=cronjob/rel1-k8s-scanner rxfaly

2. Get list of pods

kubectl get pods

3. Tail logs for running job

kubectl logs -l "app.kubernetes.io/name=k8s-scanner" -f
```

#### Uninstalling k8s-scanner

```bash
helm delete rel1
release "rel1" uninstalled
```
