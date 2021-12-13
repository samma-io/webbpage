---
title: Why i built Samma
date: 2021-12-06 09:00:00
tags:
- samma
- DevSecOps
- Scanner
- mattias
categories:
- story
- samma
keywords:
    - samma
    - Mattias Hemmingsson
    - story
---




## First page
Why I started samma scanner. The scanners I worked with were far away from the developer. They were run on some external server and you could "Schedule a scan" that was started when there was space on the scanner server.

I did see a problem with this a wanted scanners to be 

## Light
I wanted the scanner to be light runs fast and can be run anywhere from a scanner engine but also from a developer laptop.

## Early
The scanner should also be able to run early in the development process as you can. When you set up your env and work with your code. I the scanners pick up a finding there it is easy to resolve the finding and also fast and cheap. #devsecops

## One 
Why sit and wait for scanners running that had nothing to do with the findings you were trying to fix?
So instead of a larger scanner samma is set up by many small scanners that do one task.
For example, we use the Nmap scanner but the scanner is divided into 3 scanners. One does port scanning, One does HTTP recon and the last does TLS fingerprint.
So depending on the finding you can run the correct scanner to verify and resolve the finding.

## Monitor the delta 
I spend many hours trying to explain why a "high finding" did was not applicable to our applications. 
It was a never-ending story where the same finings come back and had to be explained to new people over and over again.
With Samma, I wanted to move over to use scanner results in the same way I monitor applications. We have a steady beat that runs and when the beats change then we have a new finding.

## Scan everything all the time
Setting up a new scanner for new applications was hard really hard in the old days. You added the scanner to your dev environment and now you had findings in 2 places and also had to handle false positives at both locations.
With samma, I added tags so you can group the scans together.
So scan ALL your environments on an application and see the beat change if 1 of the environments is different.


## Keeping targets updated
Adding and removing IP addresses and domains from scanners is a time-consuming thing. And then it's not automated is always that human that things go wrong. This was one of the things I had the most issues with when using traditional scanners.
So with samma, I added a simple operator that picks up any changes in a Kubernetes cluster. And then new endpoints are deployed or deleted. The operator deploys or removes scanners as needed.
(Planned to upgrade to connect to a cloud provider and the find targets in your account and deploy scanners :-) )


## What a have already a Dashboard!
When running my apps a already have set up dashboards that I use to monitor my applications. And I don't want to login into your special dashboard and there find what's wrong. Please bring your data in a standard way and then I can use the tools and dashboard I already have.

All Samma scanners print the result in JSON format. Into regular stout. Now your standard log pipeline can transfer the data to the tool you want.
Then have the trends of scans and dashboard together with your regular data.

With Samma, we provide a filebeat and dashboards for grafana och kibana ready when using elasticsearch as backend.


### Me

Mattias Hemmingsson

https://github.com/mattiashem
https://www.linkedin.com/in/matte-hemmingsson/
https://hacking.robots.beer/

