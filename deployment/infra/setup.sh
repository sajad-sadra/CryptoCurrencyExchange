# add repos
helm repo add prometheus-community https://prometheus-community.github.io/helm-charts
helm repo add grafana https://grafana.github.io/helm-charts
helm repo update

# update dependencies (will pull charts into charts/)
helm dependency update

# install into minikube (create namespace if missing)
kubectl create namespace monitoring

# install the chart
helm install monitoring ./ -n monitoring