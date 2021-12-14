# Webbpage for samma.io

Main site for samma.io


## Hugo CMS 
this weppgae is build with hugo CMS. To read more go to hugo cms webpage


## Edit

To work with the site first boot up the hugp cms tool- The dev env is build around docker and docker-compose to work


### start up
```
docker-compose up
```
This will boot up the hugp dev server and you can now reatch the site as http://localhost:1313


### Edit
To edit make changes in to the /src/story/content folder



### Deploy
When done push you changes back to git in the main branch.
Your changes will be deployed.


First build the page with 

```
docker-compose run hugo hugo
```



Commi all changes and push back

```
git commit -a -m "My change note"


git push origin main
```


When a new push to main is done. The webbpage is automated deployed


