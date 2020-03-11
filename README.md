# Alfred plugin: ArgoCD

This plugin syncs a specific application running on a K8S cluster through [ArgoCD](https://argoproj.github.io/argo-cd/).
## Parameters

* `argocd_auth_token`

JSON Web Token of an ArgoCD role needed to interact with its resources.

This parameter is required.

* `application_name`

Name of an existing application already created on the K8S cluster and managed via ArgoCD.

This parameter is required.


## Example usage
```
- name: Sync the application via ArgoCD
  image: wuakitv/alfred-argocd
  when:
    branch:
      - master
  settings:
    argocd_auth_token:
      from_consul_secret: argocd_auth_token
    application_name: <app_name>
    argocd_server: <server_name>
```
