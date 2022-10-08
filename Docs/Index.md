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


```mermaid
graph TB
 linkStyle default interpolate basis
 wan1[<center>DSL 1000/300 Mb<br><br>HOME IP</center>]---router{<center>YouSee Router<br>192.168.0.1</center>}
 router---|1Gb|rum_1[<center>Rum 1 switch</center>]
 router---|1Gb|rum_2[<center>Rum 2 switch</center>]
 router---|1Gb|rum_3[<center>Rum 3 switch<br>192.168.0.173</center>]
 router---|1Gb|rum_4[<center>Rum 4 switch</center>]
 router---|wifi|ac_wifi(<center>Router-Wifi</center>)

subgraph Wifi
ac_wifi-.-Multiple[<center>Multiple Wifi Clients</center>]
ac_wifi-.-chromecast-rum-1
end

subgraph Rum 4
rum_4---|1Gb|free_2(<center>Free port</center>)
end


subgraph Rum 3
rum_3-.-|1Gb|chromecast-rum3
rum_3---|1Gb|gamer-pc
end

subgraph Rum 2
rum_2---|1Gb|free_1(<center>Free port</center>)
end

subgraph Rum 1
rum_1---|1Gb|pi(<center>RPi 4<br>192.168.0.126</center>)
rum_1---|1Gb|work(<center>RA: Work-Laptop</center>)
rum_1---|1Gb|work-lab(<center>RA: Work-Laptop2</center>)
end

    subgraph pi 1
    pi---docker(<center>Docker</center>)
    pi---crowdsec(<center>CrowdSec</center>)
    end

    subgraph docker1
    docker-.-smokeping(<center>SmokePing<br>10.20.30.151</center>)
    docker-.-uptimeKuma(<center>UptimeKuma<br>10.20.30.151</center>)
    docker-.-pihole(<center>PI-hole<br>10.20.30.151</center>)
    docker-.-wireguardvpn(<center>Wireguard-vpn<br>10.20.30.151</center>)
    end


```