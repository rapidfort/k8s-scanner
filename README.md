# k8s-scanner

<b> k8s-scanner is RapidFort's Kubernetes SCA scanner</b>

It enumerates all container images running in Kubernetes cluster
and sends them to RapidFort's SCA scanner to prepare SBOM and accurate vulnerability report.

## Prerequisites

Before installing the chart, you must first create a free account on [RapidFort](https://frontrow.rapidfort.com) and generate a service account.

Service account will provide RF_ACCESS_ID and RF_SECRET_ACCESS_KEY values. Please export the values in your environment or add them to your profile.

## Installing the chart

To install the chart with the release name `my-release`:


```bash
## Add the RapidFort Helm repository
$ helm repo add rapidfort https://rapidfort.github.io/helm

## Install the k8s-scanner helm chart
$ helm upgrade --install my-release rapidfort/k8s-scanner \
    --set secret.rf_access_id=$RF_ACCESS_ID \
    --set secret.rf_secret_access_key=$RF_SECRET_ACCESS_KEY
```

> **Tip**: List all releases using `helm list --all-namespaces`

## Uninstalling the chart

To uninstall/delete the my-release deployment:

```bash
$ helm delete my-release
```

## Configuration

| Parameter                 | Description  | Default     |
| ---------                 | ------        | ------        |
| `global.rf_app_host`      | RapidFort platform URL | https://frontrow.rapidfort.com |
| `secret.rf_access_id`     | RF_ACCESS_ID for RapidFort service account | "" |
| `secret.rf_secret_access_key`    | RF_SECRET_ACCESS_KEY for RapidFort service account | "" |
| `image.repository`    | Container image repository | "rapidfort/k8s-scanner" |
| `cronSchedule`    | Cron schedule for enumerating images running in Kubernetes cluster | "0 */12 * * *" (Run every 12 hours) |
| `image.tag`   | Container image tag | "latest" |
| `image.pullPolicy`   | Container image pullPolicy | "Always" |
| `imagePullSecrets`   | Image pull secrets for private registry | "[]" |

## Cluster Role

k8s-scanner needs to enumerate list of all pods running in kubernetes cluster and hence need "list" permission on "pods" resource for entire cluster.

```
- apiGroups: [""]
  resources: ["pods"]
  verbs: ["list"]
```

## Host Access

k8s-scanner currently needs to access host machine docker socket running at `/var/run` to access Docker images. It also needs access to `/tmp` volume for accessing exported docker images.

```
          volumes:
          - name: docker-sock
            hostPath:
              path: /var/run
          - name: docker-tmp
            hostPath:
              path: /tmp
```
