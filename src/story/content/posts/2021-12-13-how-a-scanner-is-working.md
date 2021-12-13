---
title: How a Scanner is working
date: 2021-12-13 09:00:00
tags:
- samma
- mattias
categories:
- samma
keywords:
    - samma
    - Mattias Hemmingsson
    - story
---



# How a scanner is working 
This will explain how a samma scanner is working.


## Start the scanner 
The first part of the scanner is a wrapper that starts the scan. These are on some scanner a python scripts that read the ENV values in the docker. And then wraps the scanner commands after these settings.

this is one of the commands that start the Nmap scanner
```
process = subprocess.Popen('sudo /bin/nmap -sV --script http-enum  {0} -oX /out/result.xml '.format(os.environ['TARGET']) , shell=True, stdout=subprocess.PIPE)

```

## Parse the result
The next step is to parse the result from the scanner. In the command from above, you see a file called result.xml.
In that file, Nmap stores all the findings. But so that our time databases can use the result samma has file parser for Nmap results.

The XML file is parsed and then produces a JSON record with every finding. 
These results are printed out using stout in the docker container.