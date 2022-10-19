<a href="https://rapidfort.com?utm_source=github&utm_medium=k8s_scanner_rf_link&utm_campaign=oct_01_sprint&utm_term=k8s_scanner_main_landing&utm_content=main_landing_logo">
<img src="https://raw.githubusercontent.com/rapidfort/k8s-scanner/main/contrib/github_logo.png" alt="RapidFort" width="200" />
</a>

# k8s-scanner

<a href="https://hub.docker.com/r/rapidfort/k8s-scanner"> <img src="https://raw.githubusercontent.com/rapidfort/k8s-scanner/main/contrib/view_on_dockerhub_button.svg" alt="View on Dockerhub" height="25" /> </a>
<a href="https://github.com/rapidfort/k8s-scanner">
<img src="https://raw.githubusercontent.com/rapidfort/k8s-scanner/main/contrib/view_on_github_button.svg" alt="View on GitHub" height="25" />
</a>
<a href="https://artifacthub.io/packages/helm/rapidfort/k8s-scanner">
<img src="https://raw.githubusercontent.com/rapidfort/k8s-scanner/main/contrib/view_on_artifacthub_button.svg" alt="View on GitHub" height="25" />
</a>


<b>k8s-scanner is [RapidFort](https://rapidfort.com)'s Kubernetes SCA scanner</b>

Generate [SBOMs](https://www.rapidfort.com/post/what-is-software-optimization) and get an accurate vulnerability report for every container running in your Kubernetes cluster. View the results on the RapidFort platform.

## Getting Started

1. Create a free account on [RapidFort](https://frontrow.rapidfort.com).

1. Launch the Quick Start guide and click "Kubernetes Scanner" to generate a service account for your Kubernetes instance.

1. Export the RF_ACCESS_ID and RF_SECRET_ACCESS_KEY values for your environment or add them to your profile.

## Installing the Helm Chart

To install the [chart](https://helm.sh/docs/topics/charts/) with the release name `my-release`:

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

To uninstall/delete the `my-release` deployment:

```bash
$ helm delete my-release
```

## Configuration

| Parameter                 | Description  | Default     |
| ---------                 | ------        | ------        |
| `global.rf_root_url`      | RapidFort platform URL | https://frontrow.rapidfort.com |
| `secret.rf_access_id`     | RF_ACCESS_ID for RapidFort service account | "" |
| `secret.rf_secret_access_key`    | RF_SECRET_ACCESS_KEY for RapidFort service account | "" |
| `image.repository`    | Container image repository | "rapidfort/k8s-scanner" |
| `cronSchedule`    | Cron schedule for enumerating images running in Kubernetes cluster | "0 */12 * * *" (Run every 12 hours) |
| `image.tag`   | Container image tag | "latest" |
| `image.pullPolicy`   | Container image pullPolicy | "Always" |
| `imagePullSecrets`   | Image pull secrets for private registry | "[]" |

## Cluster Role

k8s-scanner enumerates a list of all pods running in your Kubernetes cluster, so it requires "list" permission on the "pods" resource for the entire cluster.

```
- apiGroups: [""]
  resources: ["pods"]
  verbs: ["list"]
```

## Host Access

k8s-scanner currently needs to access the host machine's docker socket running at `/var/run` to access Docker images. It also needs access to `/tmp` volume for accessing exported docker images.

```
volumes:
- name: docker-sock
  hostPath:
    path: /var/run
- name: docker-tmp
  hostPath:
    path: /tmp
```


## Need support

<a href="https://join.slack.com/t/rapidfortcommunity/shared_invite/zt-1g3wy28lv-DaeGexTQ5IjfpbmYW7Rm_Q">
<img src="https://raw.githubusercontent.com/rapidfort/k8s-scanner/main/contrib/github_banner.png" alt="RapidFort Community Slack" width="600" />
</a>

## 🌟 Star this project

[![](https://user-images.githubusercontent.com/48997634/174794647-0c851917-e5c9-4fb9-bf88-b61d89dc2f4f.gif)](https://github.com/rapidfort/k8s-scanner/stargazers)

### [⏫⭐️ Scroll to the star button](#start-of-content)

If you believe this project has potential, feel free to **star this repo** just like many [amazing people](https://github.com/rapidfort/k8s-scanner/stargazers)
have.

## Additional Resources

[![RapidFort](https://raw.githubusercontent.com/rapidfort/k8s-scanner/main/contrib/github_logo_footer.png)][rf-link-main-landing-footer-logo]


Learn more about container optimization at [RapidFort.com][rf-link-additonal-resource].

[rf-link-main-landing-footer-logo]: https://rapidfort.com?utm_source=github&utm_medium=k8s_scanner_rf_link&utm_campaign=oct_01_sprint&utm_term=k8s_scanner_main_landing&utm_content=main_landing_footer_logo

[rf-link-additonal-resource]: https://rapidfort.com?utm_source=github&utm_medium=k8s_scanner_rf_link&utm_campaign=oct_01_sprint&utm_term=k8s_scanner_main_landing&utm_content=additonal_resource
