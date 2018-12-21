# Project Management

- Trello
- Github
- Discord

# Requirements

- Wall of Sheep
    - Passwords
    - Images
- Attack visualisation
    - Challenge attempts
    - Verschillende researchprojecten, maar weinig substantieels
- Statistics
    - Dns requests
    - Uptime monitoring
    - System resources
- Traffic onderscheppen
    - Port forwarding
    - Monitor / SPAN / Mirror-poort
- Documentatie
- Verslag

# Extra features

- PCAP replay voor testing -> Bro -r
- Herbekijken van logs, niet enkel real-time -> Timelion
- Performance
    - CSV parser i.p.v. default grok (+ benchmark)
    - Enkel minimum nodige services
    - Minimum hardware voor real-time visualisatie?
    - Throughput benchmark
- Scalability
    - Meerdere workers?
    - Dashboard aparte host? + Filebeat
- Visuele aanpassingen
    - Kibana theme
    - Verwerking van WoS in geheel
    - Open dashboard automatically
- Integratie met CTFd
    - Challenge name + url parsing?

# Software stack

## Logging/Parsing/Dashboard

### ELK (Elasticsearch + Logstash + Kibana)

- Industriestandaard voor monitoring
- Open-source alternatief voor Splunk
- Geen eenvoudige manier voor afbeeldingen (WoS)
- Seamless integrated 'beats' for extra inputs
    - Metricbeat: Monitor system resources
    - Heartbeat: Monitor instances uptime

### Alternatieven

- Security Onion
    - All-in-one solution
    - 2 fysieke adapters nodig?
    - Configuratie moeilijk te deployen
    - Bloated, overkill?
    - Nog steeds configuratie nodig (regels, filters, ...) en WoS
    - Lange setup en nog meer complexiteit
    - Recommended hardware: 4 CPU cores and 8GB of RAM
    - Draait ook gewoon in docker containers in vm
    - Interessante filters kopiëren?
- Fluentd
    - Vervanger voor logstash
    - Minder supported
- collectd
    - Meer voor system administration

## Network analysis

### Bro

- Industriestandaard voor open-source IDS + network analysis
- Heel veel voorgemaakte scripts en documentatie
- Integreert 'eenvoudig' met ELK

### Alternatieven

- Packetbeat
    - Seamless integration met ELK
    - Ondersteunt applicatielaag + TCP/UDP flow
    - Relatief weinig protocollen out of the box, en zeker geen scripts (SQLi, brute-force, ...)
    - Voorlopig nog niet mature genoeg, maar misschien als secondary input?
    - Built to live on endpoints
    - Beats: lightweight agents on the server
- SNORT / Suricata
    - Te gelijkaardig aan Bro

## Wall of Sheep

### Dofler
- Modern wall of sheep
- Used at Brucon
- Easy setup

### Alternatieven

- dsniff / driftnet
    - Classic tools
    - Enorm outdated
    - Difficult to setup (today)
- John-Lin/wallofsheep
    - Enkel wachtwoorden
    - Enkel HTTP, FTP, IMAP en POP3

## Deployment

### Docker

- Industriestandaard voor deployment
- Easy deployment
- Eenvoudig config files aan te passen
- Schaalbaar / deelbaar
- Intern netwerk

## Visualization

### Ergo Witness

- Integreert met elasticsearch
- 3D visualisatie
- Open-source, relatief eenvoudig aan te passen
- Verbindingen enkele seconden zichtbaar as expected
- Meerdere protocollen

### Alternatieven
- Naggen
    - Overzichtelijk
    - JSON import
    - Niet publiek te gebruiken
- Vizceral
    - Gemaakt door Netflix
    - WebGL

# Demo
- Wifi netwerk verbindbaar
- Sheep!

# Caveats
- mariadb niet opgestart voor dofler connectie
- persistent data (/db van mariadb, ...)

# Bugs todo
- create folder 'images' in dofler
- ctfd urls in markdown of niet?
- dofler wrong .json settings file
- logstash template.json
- dashboard opzetten
- wat bij problemen?
- licenses
- ctfd data folder (now in /src/)

# To research
http://demo.naggen.org/  

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
