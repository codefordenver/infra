# `codefordenver/infra`

## DESCRIPTION
- Declarative infrastructure project for codefordenver org 

### DEPENDENCIES
- [kubernetes](https://kubernetes.io/docs/tasks/tools/install-kubectl/)
- [kubectx](https://github.com/ahmetb/kubectx)
- [tanka & jsonnet-bundler](https://tanka.dev/install)
- [sops](https://github.com/mozilla/sops)
- [minikube](https://kubernetes.io/docs/tasks/tools/install-minikube/)

### SETUP
- `jb install`
- helpful kubernetes aliases and env vars
```bash
export KUBE_EDITOR="emacs" # vim / vscode - you pick
alias gc="gcloud"
alias kk="kubectl"
alias mk="minikube"
alias kcd="kubectx"
alias kns="kubectl config set-context $(kubectl config current-context) --namespace "
```

### TANKA

#### CMDs
creating a new managed environment 
- `tk env add environments/<project>/<env> --namespace=<project>-<env>`

examples:
- `tk env add environments/prom-grafana/dev --namespace=prom-grafana-dev`
- `tk env add environments/prom-grafana/stage --namespace=prom-grafana-stage`
- `tk env add environments/prom-grafana/prod --namespace=prom-grafana-prod`

*Note*: create namespace manually after adding a new environment

- `kk create ns <project-enviornment>`

*Port Forwarding*
- `kk port-forward --namespace=<ns> deployments/<deploy> <local-port>:<pod-port>`
