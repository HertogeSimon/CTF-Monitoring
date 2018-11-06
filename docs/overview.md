# Project Management
- Trello
- Github
- Discord

# Requirements
- Wall of Sheep
    - Passwords
    - Images
- Attack visualisation
- Statistics
    - Dns requests
    - Challenge attempts
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
    - Dashboard aparte host?
- Visuele aanpassingen
    - Kibana theme
    - Verwerking van WoS in geheel
- Integratie met CTFd

# Software stack
- ELK (Elasticsearch / Logstash / Kibana)
    - Industriestandaard voor monitoring
    - Open-source alternatief voor Splunk
    - Geen eenvoudige manier voor afbeeldingen (WoS)
- Bro
    - Industriestandaard voor open-source IDS + network analysis
    - Heel veel voorgemaakte scripts en documentatie
    - Integreert 'eenvoudig' met ELK
- Docker
    - Industriestandaard voor deployment
    - Easy deployment
    - Eenvoudig config files aan te passen
    - Schaalbaar / deelbaar
    - Intern netwerk
- Dofler
    - Modern wall of sheep
    - Used at Brucon
    - Easy setup

# Alternatieven
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
- Packetbeat
    - Seamless integration met ELK
    - Ondersteunt applicatielaag + TCP/UDP flow
    - Relatief weinig protocollen out of the box, en zeker geen scripts (SQLi, brute-force, ...)
    - Voorlopig nog niet mature genoeg, maar misschien als secondary input?
- SNORT / Suricata
    - Te gelijkaardig aan Bro
- Fluentd
    - Vervanger voor logstash
    - Minder supported
- collectd
    - Meer voor system administration
- dsniff / driftnet
    - Classic tools
    - Enorm outdated
    - Difficult to setup (today)

# Demo
- Wifi netwerk verbindbaar
- Sheep!

# To research
https://github.com/elastic/kibana/pull/2731
https://discuss.elastic.co/t/has-anyone-modified-kibana-code-to-display-images-or-documents/59221
http://donmizutani.com/pages/snort/setup/2-mirroring-network-traffic/
https://superuser.com/questions/1003274/home-network-setup-to-monitor-traffic-via-snort
https://wiki.wireshark.org/CaptureSetup/Ethernet
https://www.elastic.co/guide/en/kibana/current/graph-getting-started.html
https://www.elastic.co/guide/en/kibana/3.0/the-dashboard-directory.html
https://vega.github.io/vega/
https://www.sciencedaily.com/releases/2016/11/161108110627.htm
https://www.youtube.com/watch?v=3u5u5A8_SE0
https://www.youtube.com/watch?v=JureQhmXT24
https://www.google.com/search?client=firefox-b&q=network+traffic+visualization+tool
https://ff.cx/nflowvis/
http://demo.naggen.org/

# PCAPs
https://www.netresec.com/?page=PcapFiles  
https://wiki.wireshark.org/SampleCaptures  
http://tcpreplay.appneta.com/wiki/captures.html  

# References
https://knowm.org/integrate-bro-ids-with-elk-stack/  
https://www.elastic.co/guide/en/beats/packetbeat/current/index.html
https://www.youtube.com/watch?v=kqD3IzhKUQI
