# CTF Monitoring

An all-in-one monitoring system made specifically for Capture The Flag competitions. Includes a dashboard, live attack/attempt visualisation, a Wall of Sheep and some minimal CTFd integration.

# Features

- Network monitoring and analysis ([Bro](https://www.bro.org/))
- Real-time dashboard ([ELK](https://www.elastic.co/))
    - Network requests ([Security Onion](https://securityonion.net/) logstash filters)
    - VM-uptime ([CTFd](https://github.com/CTFd/CTFd) API + [heartbeat](https://www.elastic.co/products/beats/heartbeat))
    - Host system resources ([metricbeat](https://www.elastic.co/products/beats/metricbeat))
- Visualisation of attack/challenge attempts ([Ergo Witness](http://ergowitness.info/))
- Wall of Sheep ([DoFler](https://dofler.net/))

# Quick start

## Dashboard

1. Install Docker + Docker Compose
1. Clone this repo, including submodules: `git clone --recursive https://github.com/HertogeSimon/CTF-Monitoring.git`
1. If necessary, change the adapter at services.bro.command in docker/docker-compose.yml
1. Run `docker-compose up` in docker/ (this can take a while...)
1. Navigate to [http://localhost:5601/](http://localhost:5601/)
1. Go to Management -> Saved Objects, and import export.json
1. Go to Dashboard, click on 'logstash*' and make it the default index (star icon), and refresh

## Live visualisation

1. Download and start the ergo binary for your system
1. Fill in the right IP at port 9200
1. Click on DONE and ⯈

## Wall of Sheep

1. If necessary, change the adapter at Monitoring.interface in default.json (DoFler)
1. Navigate to http://localhost:3000/

## CTFd integration

1. Make sure you have installed `jq`
1. Add your challenges to CTFd; make sure to create links of the challenge VM URLs in the markdown description
1. Edit your username, password and url in ctf2hb.sh
1. Run ctf2hb.sh

# Default ports
Kibana: http://localhost:5601/  
DoFler: http://localhost:3000/  
CTFd: http://localhost:8000/  
Elasticsearch API: http://localhost:9200/

All of these can be changed in docker-compose.yml for outside connections.

# Useful docker commands

Recreate all containers (with old images)  
`docker-compose up --force-recreate --remove-orphans --renew-anon-volumes`

Rebuild a single image:  
`docker build --no-cache <container_folder>`

Follow logs of a single (running) container:  
`docker logs <container_name> -f`

Connect to a running container:  
`docker exec -it <container_name> bash`

=> This only works when the image has no defined entrypoint.

# Known bugs

## Ergo Witness 
Since Ergo Witness also relies on data from Packetbeat, the visuals are probably not as they should be.

Another problem you might encounter is the difference between local and UTC time in which Ergo Witness and Elasticsearch operate. This can create problems for Ergo's incoming data at midnight.

If you want to fix these issues, you'll need Unity v5.6.0 to recompile [my fork](https://github.com/HertogeSimon/ErgoWitness) of the project. For a more in-depth explanation, read [this blog post](http://benhoffman.tech/data%20vis/ergowitness/general/project/2017/03/10/prototype-of-ergo-witness.html) and [the official site](http://ergowitness.info/).

## DoFler

At first start, DoFler can output 'Access Denied' errors. This is because DoFler depends on the MariaDB container, which takes a while to start. Unfortunately this means you need to restart the container, but then the problem should be solved. The only (and official) solution is to delay the DoFler container with a [*hacky* script](https://docs.docker.com/compose/startup-order/), since docker's 'depends_on' relationship does not really do much.

# FAQ

**How much longer do I have to wait for this to start?**

The first installation can easily take around 15 minutes; subsequent starts should only take a minute at max.

**Can I also analyze prerecorded pcap files with this?**

Yes! Change the startup command of Bro from "-i \<network adapter\>" to "-r my.pcap", as currently commented out in docker-compose.yml.
Some useful pcap files can be found on the following sites:  
https://www.netresec.com/?page=PcapFiles  
https://wiki.wireshark.org/SampleCaptures  
http://tcpreplay.appneta.com/wiki/captures.html

**How can I add Bro scripts?**

1. Add a volume to the Bro container overwriting local.bro
1. Add a filter to the logstash pipeline if necessary
1. Add the new fields to logstash-template.json

**How can I change the dashboards?**

1. Add a visualization
2. Add it to a dashboard

Note: At the moment, a lot of bro output does not get processed. You can enable these by moving logstash filters from the disabled to the default pipeline directory.

**How do I change X?**

Most settings are configured inside docker-compose.yml, and when they're not, they're usually mounted separately as a (docker) volume, so they can be easily modified.

**Can I add the indexes and dashboards automatically to Kibana?**

Not easily, but it can be done. Either create [your own script](https://discuss.elastic.co/t/how-to-add-automatically-all-the-indices-from-elasticsearch-to-kibana/81136/2) that talks to the Kibana API, or use [metricbeat's import functionality](https://www.elastic.co/guide/en/beats/devguide/current/import-dashboards.html). The latter option is recommended, but you'll have to [delay](https://docs.docker.com/compose/startup-order/) metricbeat's startup since it NEEDS a running Kibana to work.

**I heard the ELK stack is written in Java. How do I add more RAM?**

Good thinking! You can increase the 'Xmx' and 'Xms' parameters in docker-compose.yml.

