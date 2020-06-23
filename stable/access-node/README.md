# Twingate Helm Chart

[Twingate](https://www.twingate.com/) is remote access for the modern world.

## TL;DR;

```console
$ helm repo add twingate ....
$ helm install my-release twingate/access-node -n [namespace]
```

## Introduction

This chart bootstraps a [Twingate Access Node](https://hub.docker.com/r/twingate/access-node) deployment on a [Kubernetes](http://kubernetes.io) cluster using the [Helm](https://helm.sh) package manager.

## Prerequisites

- Kubernetes 1.12+
- Helm 3.0+

## Installing the Chart

To install the chart with the release name `my-release`:

```console
$ helm repo add twingate https://twingate.github.io/helm-charts
$ helm install my-release twingate/access-node -n [namespace]
```

These commands deploy Twingate on the Kubernetes cluster in the default configuration. The [Parameters](#parameters) section lists the parameters that can be configured during installation.

> **Tip**: List all releases using `helm ls -n [namespace]`

## Uninstalling the Chart

To uninstall/delete the `my-release` deployment:

```console
$ helm del my-release -n [namespace]
```

The command removes all the Kubernetes components associated with the chart and deletes the release.

## Parameters

The following table lists the configurable parameters of the Twingate chart and their default values.

| Parameter                               | Description                                                                 | Default                                                 |
|-----------------------------------------|-----------------------------------------------------------------------------|---------------------------------------------------------|
| `image.registry`                        | Twingate image registry                                                     | `docker.io`                                             |
| `image.repository`                      | Twingate image name                                                         | `twingate/access-node`                                  |
| `image.tag`                             | Twingate image tag                                                          | `latest`                                                |
| `image.pullPolicy`                      | Twingate image pull policy                                                  | `IfNotPresent`                                          |
| `image.pullSecrets`                     | Specify docker-registry secret names as an array                            | `[]` (does not add image pull secrets to deployed pods) |
| `nameOverride`                          | String to partially override twingate.fullname template                     | `nil`                                                   |
| `fullnameOverride`                      | String to fully override twingate.fullname template                         | `nil`                                                   |
| `replicas`                              | Number of replicas for the application                                      | `1`                                                     |
| `applicationPort`                       | Port where the application will be running                                  | `80`                                                    |
| `affinity`                              | Map of node/pod affinities                                                  | `{}` (The value is evaluated as a template)             |
| `nodeSelector`                          | node labels for pod assignment                                              | `{}` (The value is evaluated as a template)             |
| `tolerations`                           | Tolerations for pod assignment                                              | `[]` (The value is evaluated as a template)             |
| `resources`                             | Resrouce limitations                                                         | `{}` (The value is evaluated as a template)             |
