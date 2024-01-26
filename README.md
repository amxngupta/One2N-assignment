# One2N Assignment

Repo for One2N Devops Assignment

Problem statement

* Create a Kubernetes cron job that pulls node metrics like (CPU, Memory, Disk usage) and stores them in a file.
* Every time the cron runs, it should create a new file. The filename should have the current timestamp.
* By default, cron should be minute, but it should be configurable with the slightest changes to code.
* Choose a tool of your choice to collect and expose metrics. Preferable is node exporter.
* The instances involved here are Kubernetes nodes themselves.

Expected Output:

* The actual program code pulls the metrics and writes them to a file.
* The Dockerfile to containerize the code.
* Kubernetes YAML or HELM Chart.
* A README file explaining the design, deployment and other details.
* If possible, record a short video to demo the output with the code files.

Note :

* Pick the choice of your language to write the cron job. Preferable is bash.
* Treat the output files generated as essential and should be retained on pod restarts.
* Deployment can either be Kube yamls, helm charts, kustomize.
* You can make necessary assumptions if required and document them.
* Choose local kubernetes setup like minikube, kind. Other option is to pick any cloud platform's kubernetes flavour.