---
title: Find security problems early
date: 2021-07-11 09:00:00
tags:
- Gitlab
- DevSecOps
- Scanner
categories:
- Devloper
- Gitlab
- k8s
keywords:
    - devsecops
    - docker
    - git
---

## You probably doing it wrong
Why do people always scan the prod site with security scanners? For me, it does not make much sense. I understand in the old days when your prod and int environments were completely different and you could run one version of apache in one place and one completely different in prod.

If that is the case for you today then fixing that is your main task.

Scanning is prod is bad you scannings code that's already live, the code is hard to fix you need to get a developer ore ops to resolve the issue and then make a patch. You take resources from your prod environment and you fill up logs and disk with scanner data.

I have also sean "Prod safe" scanners take down sites by deleting data when scanning 
```
/station/stockholm?ACTION=DELETE
```
Yes, it's bad with GET but still .... (was behind auth that the scanner had access to)


## Scan before the first merge in master
With samma and the tools we have today it`s simple to add one of Samma scanners to your pipeline.
Example on the merge request into your main branch.
And like that, you scan your app early in the process where its 
Easy to fix well the developer has proberly the editor open
It's quick see above
It's cheep no need to make extra releases ore work you are working already on it


## Keep env in sync
If you keep your test and prod environments in sync then you can have a regular scan hittings your test environments to keep the scanners updated and scan against a target that is not updated that often.


## Quick test
Also when you have the power to run a simple docker to test. If you are worried and want to test prod. 
Well, a simple docker run and you have the result of the scan.