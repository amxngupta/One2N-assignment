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
  * I have created a new namespace **monitoring** and below shown are the steps to install the node exporter helm chart
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

* 
