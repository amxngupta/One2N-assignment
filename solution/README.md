# One2N Assignment
### Solution Repo for Devops assignment by One2N
---

* Download minikube and install
    > curl -LO https://storage.googleapis.com/minikube/releases/latest/minikube-darwin-arm64 \
      sudo install minikube-darwin-arm64 /usr/local/bin/minikube
    
    ![1.png](images%2F1.png)

* Start minikube with 4 nodes k8s cluster
    > minikube start --nodes 4 -p democluster

    ![2.png](images%2F2.png)
    ![3.png](images%2F3.png)

* Since our cluster is now up and running we need to install node-exporter in order to expose our cluster node metrics.
  * Choice of tool to be used here is [node-exporter](https://github.com/prometheus/node_exporter)
  * We will be using upstream [helm chart](https://github.com/prometheus-community/helm-charts/tree/main/charts/prometheus-node-exporter) for node-exporter which is managed by prometheus community.
  * Let's install it in new namespace **monitoring** and below shown are the steps for installation:
     > helm repo add prometheus-community https://prometheus-community.github.io/helm-charts \
       helm repo update \
       helm install node-exporter prometheus-community/prometheus-node-exporter -n monitoring

     ![4.png](images%2F4.png)
  * We have 4 node k8s cluster, and you'll notice that node-exporter is running as Daemonset on all nodes.
  * Installing helm chart created a service-account, deamonset and service.
  * Let's port forward it and check if our node-exporter installation is working as expected or not.
     ![5.png](images%2F5.png)
  * Node exporter deployed successfully and is exposing metrics.
     ![6.png](images%2F6.png)
     ![7.png](images%2F7.png)

* For the task, creating a shell script which will be curling the node-exporter and fetching CPU, Memory and Filesystem stats.
  * We would need a docker image for out cronjob with curl installed.
  * Created a `Dockerfile` kept under **solution** directory. Used the lightweight alpine image and installed curl.
  * Build the image locally and pushed the same to my public dockerhub repo.
    ![8.png](images%2F8.png)

* Now created a `metrics-cronjob` Helm Chart for to deploy a cronjob using the image created in above step.
  * As per problem statement file needs to be retained on each restart, so mounted a pvc as well within the cronjob.
  * Shell script is under the scripts directory in `metrics-cronjob` helm chart folder.

* Let's install the Helm Chart and see it if the cronjob runs as per schedule.
  > helm install metrics-cronjob /Users/amangupta/Documents/Code/One2N-assignment/solution/metrics-cronjob -n cronjob

    ![9.png](images%2F9.png)
  As per the logs cronjob runs fine and has stored the metrics under the corresponding filename.

* Since Current schedule for cronjob is set to every minute. You'll see new pods coming up every minute.
    ![10.png](images%2F10.png)
  This Schedule can be changed as per requirement via `values.yaml` in the metrics-cronjob helm chart.