# application-helm

![Version: 0.0.2](https://img.shields.io/badge/Version-0.0.2-informational?style=flat-square) ![Type: application](https://img.shields.io/badge/Type-application-informational?style=flat-square)

A generic helm chart for all sort of applications

**Homepage:** <https://github.com/pawapay/application-helm>

## Values

| Key | Type | Default | Description |
|-----|------|---------|-------------|
| applicationName | string | `"application-helm"` | Name of the application. |
| environment | string | `"development"` | Environment for application |

### Deployment

| Key | Type | Default | Description |
|-----|------|---------|-------------|
| deployment.additionalContainers | string | `nil` | Any additional containers besides init and app containers |
| deployment.affinity | string | `nil` | Pod affinity and pod anti-affinity |
| deployment.annotations | string | `nil` | Annotations on deployments |
| deployment.containerSecurityContext | object | `{"allowPrivilegeEscalation":false,"capabilities":{"drop":["all"]},"readOnlyRootFilesystem":true}` | Setting for Container Security Context |
| deployment.env | string | `nil` | Environment variables to be passed to the app container |
| deployment.envFrom | list | `[]` | Mount Envs from configmap or secret |
| deployment.hostAliases | string | `nil` | Set DNS Alias for an IP |
| deployment.image | object | `{"pullPolicy":"IfNotPresent","repository":"repository/image-name","tag":"v1.0.0"}` | Image of the app container |
| deployment.imagePullSecrets | string | `nil` | Secrets used to pull image |
| deployment.initContainers | string | `nil` | Init containers which runs before the app container |
| deployment.labels | string | `nil` | Additional labels for Deployment |
| deployment.nodeSelector | string | `nil` | Select nodes to deploy which matches the following labels   |
| deployment.podAnnotations | string | `nil` | Additional Pod Annotations created by this Deployment |
| deployment.podLabels | string | `nil` | Additional label added on pod which is used in Service's Label Selector |
| deployment.probes.livenessProbe.failureThreshold | int | `3` |  |
| deployment.probes.livenessProbe.httpGet.path | string | `"/actuator/health"` |  |
| deployment.probes.livenessProbe.httpGet.port | string | `"actuator"` |  |
| deployment.probes.livenessProbe.periodSeconds | int | `10` |  |
| deployment.probes.livenessProbe.successThreshold | int | `1` |  |
| deployment.probes.livenessProbe.timeoutSeconds | int | `1` |  |
| deployment.probes.readinessProbe.failureThreshold | int | `3` |  |
| deployment.probes.readinessProbe.httpGet.path | string | `"/actuator/health"` |  |
| deployment.probes.readinessProbe.httpGet.port | string | `"actuator"` |  |
| deployment.probes.readinessProbe.initialDelaySeconds | int | `10` |  |
| deployment.probes.readinessProbe.periodSeconds | int | `10` |  |
| deployment.probes.readinessProbe.successThreshold | int | `1` |  |
| deployment.probes.readinessProbe.timeoutSeconds | int | `1` |  |
| deployment.probes.startupProbe.failureThreshold | int | `30` |  |
| deployment.probes.startupProbe.httpGet.path | string | `"/actuator/health"` |  |
| deployment.probes.startupProbe.httpGet.port | string | `"actuator"` |  |
| deployment.probes.startupProbe.periodSeconds | int | `10` |  |
| deployment.replicas | int | `1` | Number of Replicas |
| deployment.resources | string | `nil` | Resources to be defined for pod |
| deployment.revisionHistoryLimit | int | `4` | Revision History Limit for Replica Sets |
| deployment.terminationGracePeriodSeconds | int | 30 | Termination Grace Period in Seconds for Pods |
| deployment.securityContext | object | `{"fsGroup":2000,"runAsGroup":3000,"runAsNonRoot":true,"runAsUser":10001}` | Security Context for the pod |
| deployment.strategy | object | `{"rollingUpdate":{"maxSurge":1,"maxUnavailable":0},"type":"RollingUpdate"}` | The strategy used for update of pods  |
| deployment.tolerations | string | `nil` | Taint tolerations for nodes |
| deployment.volumeMounts | string | `nil` | Mount path for Volumes, check samples in values file |
| deployment.volumes | string | `nil` | Volumes to be added to the pod, check samples in values file |

### Service

| Key | Type | Default | Description |
|-----|------|---------|-------------|
| service.annotations | string | `nil` | Additional annotations added on Service |
| service.ingress_port | int | `8080` | ingress_port is used in Ingress & tests |
| service.labels | string | `nil` | Additional label added on Service |
| service.ports | list | `[{"web":8080},{"actuator":8081}]` | add ports block to service & deployment, can add ports like PORT_NAME: PORT_NUMBER |
| service.type | string | `"ClusterIP"` | Type of Service |

### Ingresses

| Key | Type | Default | Description |
|-----|------|---------|-------------|
| ingresses.enabled | bool | `false` | Enable or Disable Ingress |
| ingresses.manifests | string | `nil` | List of Ingresses Manifests - nameSuffix is the suffix to add in name of Ingress, default name is $application-name |

### RBAC

| Key | Type | Default | Description |
|-----|------|---------|-------------|
| rbac.clusterroles | string | `nil` | Create ClusterRoles (Clusterwide) and bind to Service Account |
| rbac.enabled | bool | `true` | Enable or Disable RBAC |
| rbac.existingClusterroles | string | `nil` | Bind any existing ClusterRole to service account  |
| rbac.existingRoles | string | `nil` | Bind any existing Role to service account  |
| rbac.roles | string | `nil` | Create Roles (Namespaced) and bind to Service Account |
| rbac.serviceAccount | object | `{"annotations":null,"enabled":true,"labels":null,"name":""}` | Service Account to use by pods |
| rbac.serviceAccount.annotations | string | `nil` | Annotations on service account  |
| rbac.serviceAccount.labels | string | `nil` | Additional Labels on service account |
| rbac.serviceAccount.name | string | `""` | Empty name is the default name i.e. $application-name |

### Configmap

| Key | Type | Default | Description |
|-----|------|---------|-------------|
| configMap.annotations | string | `nil` | Additional annotations for configmap |
| configMap.enabled | bool | `false` | Create new Configmap |
| configMap.files | string | `nil` | Create files as part of Configmap Data |
| configMap.labels | string | `nil` | Additional label for configmap |

### Secret

| Key | Type | Default | Description |
|-----|------|---------|-------------|
| secret.annotations | string | `nil` | Additional annotations for secret |
| secret.enabled | bool | `false` | Create new secret |
| secret.files | string | `nil` | Create files as part of Configmap Data |
| secret.labels | string | `nil` | Additional label for secret |

### Persistence

| Key | Type | Default | Description |
|-----|------|---------|-------------|
| persistence.accessMode | string | `"ReadWriteOnce"` |  |
| persistence.annotations | string | `nil` |  |
| persistence.enabled | bool | `false` | Add Storage volumes(PVCs) to the pods |
| persistence.labels | string | `nil` |  |
| persistence.mountPVC | bool | `false` |  |
| persistence.mountPath | string | `"/"` |  |
| persistence.storageClass | string | `""` |  |
| persistence.storageSize | string | `"8Gi"` |  |

### AutoScaling

| Key | Type | Default | Description |
|-----|------|---------|-------------|
| autoscaling.annotations | string | `nil` | Additional annotations in key value pair |
| autoscaling.enabled | bool | `false` | Flag for enabling or disabling autoscaling  |
| autoscaling.labels | string | `nil` | Additional Labels on HPA |
| autoscaling.maxReplicas | int | `10` | maxReplicas sets the maximum number of replicas |
| autoscaling.metrics[0].resource.name | string | `"cpu"` |  |
| autoscaling.metrics[0].resource.targetAverageUtilization | int | `60` |  |
| autoscaling.metrics[0].type | string | `"Resource"` |  |
| autoscaling.metrics[1].resource.name | string | `"memory"` |  |
| autoscaling.metrics[1].resource.targetAverageUtilization | int | `60` |  |
| autoscaling.metrics[1].type | string | `"Resource"` |  |
| autoscaling.minReplicas | int | `1` | minReplicas sets the minimum number of replicas |

----------------------------------------------
Autogenerated from chart metadata using [helm-docs v1.9.1](https://github.com/norwoodj/helm-docs/releases/v1.9.1)
