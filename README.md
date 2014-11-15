Docker-SickBeard-ITA
====================

Docker for SickBeard-ITA [TNTVillage support]

This is a Dockerfile setup for sickbeard using the repo from https://github.com/gborri/Sick-Beard

To run:

```
docker run -d --name="sickbeard-ita" -v /path/to/sickbeard-ita/data:/config -v /path/to/downloads:/downloads -v /path/to/tv:/tv -v /etc/localtime:/etc/localtime:ro -p 8081:8081 l3rd/sickbeard-ita
```

Edge
----
If you would like to run the latest updates from the master branch as well as enable in-app updates run:

```
docker run -d --name="sickbeard-ita" -v /path/to/sickbeard-ita/data:/config -v /path/to/downloads:/downloads -v /path/to/tv:/tv -v /etc/localtime:/etc/localtime:ro -e EDGE=1 -p 8081:8081 l3rd/sickbeard-ita
```
Based on https://github.com/needo37/sickbeard
