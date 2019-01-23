# CTF Monitor

# Quick start
- Install Docker + Docker Compose (also for [Windows](https://www.docker.com/community-edition#/download), but disables VMWare / VBox)
- Run `docker-compose up` in src/
- Go to `http://localhost:5601`
- Create a new index pattern

# Requirements

- Wall of Sheep
- Attack visualisation
- Statistics
    - Dns requests
    - Uptime monitoring
    - System resources
- Traffic onderscheppen
- Documentatie
- Verslag

# Extra features

- Performance
    - CSV parser i.p.v. default grok (+ benchmark)

# Caveats
- mariadb niet opgestart voor dofler connectie
- persistent data (/db van mariadb, ...)

# Bugs todo
- CTFd combineren met db
- heartbeat
- ergo witness crash
- kibana dark theme
- create folder 'images' in dofler
- ctfd urls in markdown of niet?
- dofler wrong .json settings file
- dashboard opzetten
- ctfd data folder (now in /src/)
- WoS sheep
 - screenshot bovenaan README

# PCAPs
https://www.netresec.com/?page=PcapFiles
https://wiki.wireshark.org/SampleCaptures
http://tcpreplay.appneta.com/wiki/captures.html

# References
https://knowm.org/integrate-bro-ids-with-elk-stack/
https://www.elastic.co/guide/en/beats/packetbeat/current/index.html
https://www.youtube.com/watch?v=kqD3IzhKUQI
https://wiki.wireshark.org/CaptureSetup/Ethernet
http://donmizutani.com/pages/snort/setup/2-mirroring-network-traffic/
http://benhoffman.tech/data%20vis/ergowitness/general/project/2017/03/10/prototype-of-ergo-witness.html
