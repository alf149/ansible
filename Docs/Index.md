# Home Lab - Docomentation. 

```mermaid
graph TB
 linkStyle default interpolate basis
 wan1[<center>DSL 1000/300 Mb<br><br>HOME IP</center>]---router{<center>YouSee Router<br>192.168.0.1</center>}
 router---|1Gb|switch1[<center>Kontor1 switch</center>]
 router---|1Gb|switch2[<center>Asus-router-AC<br><br>192.168.0.173</center>]
 router-,-acwifi1[<center>Router-Wifi</center>]

 subgraph wifi1
 acwifi1---chromecast-rum0(<center><br>DHCP</center>)
 acwifi1---chromecast-rum1
 acwifi1---ra-work(<center>RA: Work-Laptop<br>DHCP</center>)
 acwifi1---ra-work-lab(<center>RA: Work-Laptop2<br>DHCP</center>)
 end


 subgraph rum11
 switch1---|1Gb|pi(<center>RPi 4<br><br>192.168.0.126</center>)
 switch1---|1Gb|work(<center>RA: Work-Laptop<br>DHCP</center>)
 switch1---|1Gb|work-lab(<center>RA: Work-Laptop2<br>DHCP</center>)
 end
 
 subgraph rum3
 switch2---|1Gb|chromecast-rum3(<center>Chromecast - Martin<br>DHCP/center>)
 switch2---|1Gb|gamer-pc(<center>Martin -Game PC<br>DHCP</center>)
 end

 subgraph pi1
 pi---docker(<center>Docker<br>DHCP</center>)
 pi---crowdsec(<center>CrowdSec</center>)
 end

subgraph docker1
 docker-.-smokeping(<center>SmokePing<br><br>10.20.30.151</center>)
 docker-.-uptimeKuma(<center>UptimeKuma<br><br>10.20.30.151</center>)
 docker-.-pihole(<center>PI-hole<br><br>10.20.30.151</center>)
 docker-.-wireguardvpn(<center>Wireguard-vpn<br><br>10.20.30.151</center>)
 
 end
 ```