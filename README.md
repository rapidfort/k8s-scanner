# k8s-scanner

<b> k8s-scanner scans all images in k8s cluster with RapidFort rf-scan tool </b>

## Usage

#### Installing k8s-scanner, ensure you have RF_ACCESS_ID and RF_SECRET_ACCESS_KEY in env
```bash
helm upgrade --install rel1 k8s-scanner \
    --set secret.rf_access_id=$RF_ACCESS_ID \
    --set secret.rf_secret_access_key=$RF_SECRET_ACCESS_KEY \
    -n k8s-scanner
Release "rel1" does not exist. Installing it now.
NAME: rel1
LAST DEPLOYED: Thu Jun 30 15:47:55 2022
NAMESPACE: k8s-scanner
STATUS: deployed
REVISION: 1
TEST SUITE: None
NOTES:
1. If you want to create a run now, please run below command

kubectl -n k8s-scanner create job --from=cronjob/rel1-k8s-scanner rxfaly

2. Get list of pods

kubectl -n k8s-scanner get pods

3. Tail logs for running job

kubectl -n k8s-scanner logs -l "app.kubernetes.io/name=k8s-scanner" -f
```

#### Uninstalling k8s-scanner

```bash
helm delete rel1 -n k8s-scanner
release "rel1" uninstalled
```

## Publish instructions to helm chart

```bash
cd rapidfort/helm #root folder for https://github.com/rapidfort/helm
cp -rf ../k8s-scanner/k8s-scanner .
helm package ./k8s-scanner -d releases
helm repo index --url https://rapidfort.github.io/helm/ .
```

## Design

1. Install and login to rf cli tools
1. Use python kubernetes client to list all pods in all namespace and collect unique container images
1. Runs rf-scan tool on the image list
1. In order to run rf-scan, we Docker-outside-of-Docker design
1. This runs as k8s cron job which currently runs every 12 hours

![dood](assets/dood-1-1.png)

### Ref
* https://github.com/kubernetes-client/python/blob/master/examples/in_cluster_config.py 
* https://applatix.com/case-docker-docker-kubernetes-part-2/ 
