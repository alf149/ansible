# Home Lab - Documentation. 

Mostly a home network, but the Rasberry pi does make i out for my home lab. 
Besides that "My lab" exists on my Labtop ad a virtual lab. 

The Raspberry pi runs this services:
* Docker on the host
  * portainer, Docker admin.
  * pi-hole, DNS service and DNS filter
  * Smikeping, ping's local mashines
  * Uptime-Kuma, Thecks local and Work services. 
  * wg-easy, VPN vith wireguard
  * watchtower, offline, manualy run to update other Docker services. 
  * Swag, web proxy, cert manager(Let's encrypt) and websites
- Crowdsec on the Host, can read Docker logs and swag logs. 
The External IP has a web proxy though cloudflare. 
Some sites also has cloudflare logon. 


## A graphical representation of the NetWork

```mermaid
graph TD
 linkStyle default interpolate basis
 cloudflare[<center>CloudFlare</center>]---wan
 wan[<center>DSL 1000/300 Mb<br>HOME IP<br>Ports: 443<br>VPN ports</center>]---router{<center>YouSee Router<br>192.168.0.1</center>}
 router---|1Gb|rum_1[<center>Port 1<br>switch</center>]
 router---|1Gb|rum_2[<center>Port 2 - Free port</center>]
 router---|1Gb|rum_3[<center>Port 3<br>Switch/AC<br>192.168.0.173</center>]
 router---|1Gb|rum_4[<center>port 4 - Free port</center>]
 router---|wifi|ac_wifi(<center>Router-Wifi<br>Multiple Wifi Clients</center>)

    subgraph Rum 3
    rum_3-.-|1Gb|chromecast-rum3
    rum_3---|1Gb|gamer-pc
    end

    subgraph Rum 1
    rum_1---|1Gb|pi(<center>port 1:<br> RPi 4<br>192.168.0.126</center>)
    rum_1---|1Gb|work(<center>port 2:<br> Work Laptop</center>)
    rum_1---|1Gb|work-lab(<center>port 3:<br> Work-Lap Laptop</center>)
    end

        subgraph pi 1
        pi---docker(<center>Docker</center>)
        pi---crowdsec(<center>CrowdSec<br>Ports:<br>8080<br>6060</center>)
        end

        subgraph pi_docker
        docker-.-portainer(<center>portainer    <br>172.18.0.2<br>ports:<br>9000:9000</center>)
        docker-.-smokeping(<center>SmokePing    <br>172.18.0.3<br>Ports:<br>8081:80</center>)
        docker-.-uptimeKuma(<center>UptimeKuma  <br>172.18.0.4<br>Ports:<br>3001:3001</center>)
        docker-.-swag(<center>Swag              <br>172.17.0.2<br>Ports:<br>443:443</center>)
        docker-.-pihole(<center>PI-hole         <br>172.17.0.3<br>Ports:<br>53:53<br>8001:80</center>)
        docker-.-wg-easy(<center>wg-easy        <br>172.20.0.2     <br>Ports:<br>51820:51820<br>51821:51821</center>)
        docker-.-watchtower(<center>watchtower  <br>Offline</center>)
        end
```


