---
title: Keep Your AWS service secure
date: 2021-06-02 09:00:00
tags:
- AWS
- DevSecOps
- Scanner
categories:
- AWS
- Cloud
- k8s
keywords:
    - bash
    - aws
---

## Keep your aws targets synced
In AWS sometimes you get alot of ec2 and public ip fast. And you may want to keep them scanned and up to sync
So then its some easy task you can do.
You will also see a list of ip in grafana and kibana


### Find your public ip
In your aws cli run this command to get your public ip

```
aws ec2 describe-instances | grep PublicIpAddress | grep -o -P "\d+\.\d+\.\d+\.\d+" | grep -v '^10\.'
```

### Add scanner to thoose is now simple

First get the ip and save to file


```
aws ec2 describe-instances | grep PublicIpAddress | grep -o -P "\d+\.\d+\.\d+\.\d+" | grep -v '^10\.' >> ip.txt
```

Now run the bash script to create scanners with helm 

```
input="ip.txt"
while IFS= read -r line
do
  TARGET=$line
  NAME=$line
  HOURE=$(shuf -i 7-10 -n 1)
  MINUTE=$(shuf -i 0-60 -n 1)

  helm uninstall tsunamo-ip-$NAME -n samma-io
  helm upgrade --install tsunamo-ip-$NAME  --debug --set ip=$TARGET  /home/mahe/helm-repo/tsunami -n samma-io
  helm uninstall $NAME -n samma-io
  helm upgrade --install $NAME  --debug --set target=$TARGET --set schedule="$MINUTE $HOURE * * 5" --set image.tag=v0.2 /home/mahe/helm-repo/nmap -n samma-io
  helm uninstall nikto-$NAME -n samma-io 
  helm upgrade --install nikto-$NAME  --debug --set target=$TARGET --set schedule="$MINUTE $HOURE * * 5" /home/mahe/helm-repo/nikto  -n samma-io
done < "$input"

```


From this it shouls be a simple task to update your scanns. Tips are to create a namespaces with your aws scanners and then simple delete that namespace to remove all scanners. And then run this script to add the new.
In that way the scanners are always updated.