# Twingate Connector Helm Chart

[Twingate](https://www.twingate.com/) is remote access for the modern world.

## Introduction

This chart bootstraps a [Twingate Connector](https://hub.docker.com/r/twingate/connector) deployment on a [Kubernetes](http://kubernetes.io) cluster using the [Helm](https://helm.sh) package manager.

## Prerequisites

- Kubernetes 1.12+
- Helm 2.0+

## Installing the Chart

To install the chart with the release name `my-release`:

```shell
$ helm repo add twingate https://twingate.github.io/helm-charts
$ helm upgrade --install my-release twingate/connector -n [namespace] \
    --set connector.network=[network] \
    --set connector.accessToken=[accessToken] \
    --set connector.refreshToken=[refreshToken]
```

These commands deploy Twingate on the Kubernetes cluster in the default configuration. The [Parameters](#parameters) section lists the parameters that can be configured during installation.

> **Tip**: List all releases using `helm ls -n [namespace]`

## Uninstalling the Chart

To uninstall/delete the `my-release` deployment:

```shell
$ helm del my-release -n [namespace]
```

The command removes all the Kubernetes components associated with the chart and deletes the release.

## Parameters

The following table lists the configurable parameters of the Twingate chart and their default values.

| Parameter                               | Description                                                                 | Default                                                 |
|-----------------------------------------|-----------------------------------------------------------------------------|---------------------------------------------------------|
| `connector.network`                     | The Twingate network name, eg. acme (required)                              |                                                         |
| `connector.url`                         | The Twingate service domain                                                 | `twingate.com`                                          |
| `connector.accessToken`                 | Access Token (required)                                                     |                                                         |
| `connector.refreshToken`                | Refresh Token (required)                                                    |                                                         |
| `connector.logLevel`                    | Log Level - supported : [error, warning, info, debug]                       | `error`                                                 |
| `connector.dnsServer`                   | Custom DNS server                                                           |                                                         |
| `image.registry`                        | Twingate image registry                                                     | `docker.io`                                             |
| `image.repository`                      | Twingate image name                                                         | `twingate/connector`                                    |
| `image.tag`                             | Twingate image tag                                                          | `latest`                                                |
| `image.pullPolicy`                      | Twingate image pull policy                                                  | `Always`                                                |
| `image.pullSecrets`                     | Specify docker-registry secret names as an array                            | `[]` (does not add image pull secrets to deployed pods) |
| `nameOverride`                          | String to partially override twingate.fullname template                     | `nil`                                                   |
| `fullnameOverride`                      | String to fully override twingate.fullname template                         | `nil`                                                   |
| `securityContext.enabled`               | Enable the securityContext. See more in values file                         | `false`                                                 |
| `affinity`                              | Map of node/pod affinities                                                  | `{}` (The value is evaluated as a template)             |
| `nodeSelector`                          | node labels for pod assignment                                              | `{}` (The value is evaluated as a template)             |
| `tolerations`                           | Tolerations for pod assignment                                              | `[]` (The value is evaluated as a template)             |
| `resources`                             | Resrouce limitations                                                        | `{}` (The value is evaluated as a template)             |



Anti affinity to deployments ( ?? research )
