# Home Lab - Docomentation. 

Mostly a home network, but the Rasberry pi does make i out for my home lab. 
Besides that My "lab exists on my Labtop ad a virtual lab. 

The Raspberry på runs this services:
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


## See at grafical presentation of the NetWork
```mermaid
graph TD
 linkStyle default interpolate basis
 cloudflare[<center>CloudFlare</center>]---wan
 wan[<center>DSL 1000/300 Mb<br>HOME IP<br>Ports: 443<br>VPN ports</center>]---router{<center>YouSee Router<br>192.168.0.1</center>}
 router---|1Gb|rum_1[<center>Port 1</center>]
 router---|1Gb|rum_2[<center>Port 2 - Free port</center>]
 router---|1Gb|rum_3[<center>Port 3<br>Switch/AC<br>192.168.0.173</center>]
 router---|1Gb|rum_4[<center>port 4 - Free port</center>]
 router---|wifi|ac_wifi(<center>Router-Wifi<br>Multiple Wifi Clients</center>)

    subgraph Rum 3
    rum_3-.-|1Gb|chromecast-rum3
    rum_3---|1Gb|gamer-pc
    end

    subgraph Rum 1
    rum_1---|1Gb|pi(<center>RPi 4<br>192.168.0.126</center>)
    rum_1---|1Gb|work(<center>Work-Laptop</center>)
    rum_1---|1Gb|work-lab(<center>Work-Lap Laptop</center>)
    end

        subgraph pi 1
        pi---docker(<center>Docker</center>)
        pi---crowdsec(<center>CrowdSec</center>)
        end

        subgraph pi_docker
        docker-.-smokeping(<center>SmokePing<br>10.20.30.151</center>)
        docker-.-uptimeKuma(<center>UptimeKuma<br>10.20.30.151</center>)
        docker-.-pihole(<center>PI-hole<br>10.20.30.151</center>)
        docker-.-wireguardvpn(<center>Wireguard-vpn<br>10.20.30.151</center>)
        end

```