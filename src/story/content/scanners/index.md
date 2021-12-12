---
title: Scanners
date: 2016-08-24 17:51:42
---

# Samma Security Scanners

Samma Scanners is a set of our most used open-source scanners. They are set ut side by side and used to scan our targets. The result is then parsed and output as JSON into stout ore with filebeat to elasticsearch.
The result is then monitored and searched with grafana och kibana

## Find and Deploy, Scan output, and Monitor
Samma Scanner is built up of different parts, all the parts together form the samma scanner stack.

## Find and Deployer
The first part of Samma is the deployer. The deployer listens for Kubernetes ingress ore service and then deploys the scanner against the ingress ore service in your cluster. It Will also add a new Custom Resource to your Kubernetes cluster that you use for deploying scanners.
When a new scan starts Samma has wrapped the common scanner and point it to the target. And then read and parse the result of the scanner.

![Thefinder](/images/samma_finder.drawio.png)

## Scan output
When then the scanner is done the output of the scanner will be processed and then stored in JSON. Samma will also split up the result so every finding gets its JSON entry. This makes searching and graphing for every target easier.
The result is printed into stout four you regular log pipeline to read. Ore can be stored to disk so you can read the JSON using your favorite log parser. Samma includes a filebeat parser that can be used to send the result into an Elasticsearch.

![Theresult](/images/samma_resultat.drawio.png)

## Monitor
Samma comes with a ready dashboard that can be used to visualize the result from the scanners. There are bort dashboard for grafana and kibana.

![Theresult](/images/dashbourds.png)

## Install
Samma comes with prebuild docker images. then can be run standalone with a simple docker run command or deployed into a Kubernetes cluster and run as jobs or cronjobs

## Docker
Scan your first target with
'''
docker run samma_scanner/nikto -e TARGET=samma.io 
'''
Find all our scanners at our GitHub pages
https://github.com/samma-io/

## Helm
You can easily deploy your scanners with helm commands to start the scanners
'''
helm upgrade --install samma-io --set target=samma.io nmap-samma nmap/ 
'''

You can find all the helm charts at our helm GitHub repo
https://github.com/samma-io/helm

## Kubernetes Custom Resource
Samma also comes with a custom resurce for kubernetes. With this you can easy deploy diffrent targets from you kubernetes cluster
'''
apiVersion: samma.io/v1  
kind: Scanner
metadata: 
  name: samma-nmap     
  namespace: samma-io
spec: 
 target: www.samma.io
 scheduler: "2 19 * * *"
 samma_io_id: "12345"
 samma_io_tags: 
      - scanner
      - prod
 #samme_io_json: '{"attacke":"true"}'
 write_to_file: "true"
 elasticsearch: elasticsearch
 scanners: ['nmap']
'''

Read more at our Kubernetes operator https://github.com/samma-io/operator

## Auto Discover Targets
To learn more about Sammas auto-discover of target and to deploy the operator read more here.
https://github.com/samma-io/operator


## Highground
To use the result from the scanners feeds into an elasticsearch, Kibana, and grafana. To make it easy Samma has a pre-setup helm chart that will deploy the service needed into your cluster. This chart is called highground.
It also comes with predefined dashboards for both Grafana och Kibana
It's super easy to install using samma helm chart
https://github.com/samma-io/highground
















# Install

Samma commes with prebuild docker images. then can be run standaonly with a simple docker run command ore deployed into a Kubernetes cluster and run as jobs ore cronjobs


### Docker
Scan your first target with 

```
docker run sammascanner/nikto -e TARGET=samma.io 
```

Find all our scanners at our github pages

https://github.com/samma-io/


### Helm 

You can easu deploy you scanners with helm commands to start the scanes

```
helm upgrade --install samma-io --set target=samma.io nmap-samma nmap/ 
```

You can find all the helmcharts at our helm githib repo

https://github.com/samma-io/helm

### Kubernetes Custom Resurce

Samma also comes with a custom resurce for kubernetes. With this you can easy deploy diffrent targets from you kubernetes cluster

```
apiVersion: samma.io/v1  
kind: Scanner
metadata: 
  name: samma-nmap     
  namespace: samma-io
spec: 
 target: www.samma.io
 scheduler: "2 19 * * *"
 samma_io_id: "12345"
 samma_io_tags: 
      - scanner
      - prod
 #samme_io_json: '{"attacke":"true"}'
 write_to_file: "true"
 elasticsearch: elasticsearch
 scanners: ['nmap']
```



Read more at our kubernetes operator 
https://github.com/samma-io/operator




