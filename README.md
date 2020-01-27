# `codefordenver/infra`

## DESCRIPTION
- Declarative infrastructure project for codefordenver org 

### SETUP
- `jb install`

### DEPENDENCIES
- kubernetes
- tanka
- jb
- sops

### TANKA

#### CMDs
creating a new managed environment 
- `tk env add environments/<project>/<env> --namespace=<project>-<env>`

examples:
- `tk env add environments/prom-grafana/dev --namespace=prom-grafana-dev`
- `tk env add environments/prom-grafana/stage --namespace=prom-grafana-stage`
- `tk env add environments/prom-grafana/prod --namespace=prom-grafana-prod`
