# Setup Environmnt
> This setup is not fined tuned for production use. It is just for testing and development purposes.
> For production use, you need to make some changes and improvements.

## 1. Setup kubernetes cluster
For the test environment i used minikube to spin up a tiny local cluster.
You can see the documentation to install it [here](https://minikube.sigs.k8s.io/docs/start/).

## 2. Install Helm Client
Helm is a package manager for Kubernetes that helps you manage Kubernetes applications.
You can see the documentation to install it [here](https://helm.sh/docs/intro/install/).

## 3. Prepare the monitoring stack
I created an umbrella helm chart to manage the monitoring stack.
This umbrella chart includes some other chart as dependency and it install these components in the cluster:
- **Prometheus**: For metrics collection.
- **Loki**: For log aggregation.
- **Grafana**: For visualization the metrics and logs.

To install the monitoring stack, run the prepared bash script `setup.sh` in the `deployment/infra` directory.

This chart will spin up all three component and add prometheus and loki as datasource to the grafana
automatically.

> You should access grafana via port-forward it's service. also it has one admin user and the password to it is stored under a secret.

## 4. Deploy the application
To deploy the application in the cluster install the prepared helm chart in the `deployment/application` directory.
You can customize the deployment by editing the `values.yaml` file in the same directory.
To install the application, run the following command:
```bash
helm install <release-name> .
```
Replace `<release-name>` with a name for your release(for example `my-crypto-exchange`).

## 5. Access the application
The application is exposed via a LoadBalancer service.
In minikube, you can use the `minikube tunnel` command to create a tunnel to the LoadBalancer service.
Run the command in a seperate terminal session:
```bash
minikube tunnel
```
Then, you can get the application address by running the following command:
```bash
minikube service <release-name>-app --url
```
Replace `<release-name>` with the name you used in the previous step.
It will return the URL of the application. just copy and paste it in your browser.

# TODO
These are some of the things that can be improved in this setup:
 - Add resource requests and limits for each component.
 - Add readiness probe for each component.
 - Add wait for database if Django migration is not handling this.
 - Make ingress with domain and TLS instead of loadbalancer.
 - Use operator(i recommend CloudNativePG) for PostgreSQL or:
   - Make backup job store backup files in object storage like S3.
   - Add retention feature to backup job.
   - Make PostgreSQL HA.