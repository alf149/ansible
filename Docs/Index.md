# Home Lab - Docomentation. 

```mermaid
graph TB
 linkStyle default interpolate basis
 wan1[<center>DSL 1000/300 Mb<br><br>80.167.181.49</center>]---router{<center>EdgeRouter-X<br><br>192.168.0.1</center>}
 ip((<center><br>IP<br><br></center>))-.-router
 dns((<center><br>DNS<br><br></center>))-.-router
 router---|1Gb|switch1[<center>TL-SG105E<br><br>10.20.30.2</center>]
 router---|1Gb|switch2[<center>Asus-Martin<br><br>10.20.30.2</center>]
 
 subgraph kontor1
 switch1---|1Gb|pi(<center>RPi 3B<br><br>10.20.30.150</center>)
 switch1---|1Gb|work(<center>RA: Work-Laptop<br><br>10.20.30.151</center>)
 switch1---|1Gb|work-lab(<center>RA: Work-Laptop2<br><br>10.20.30.170</center>)
 end
 
 subgraph rum1
 switch2---|1Gb|chromecast(<center>Chromecast - Martin<br>DHCP/center>)
 switch2---|1Gb|game-pc(<center>Martin -Game PC<br>DHCP</center>)
 end

 subgraph pi1
 pi---|1Gb|docker(<center>Chromecast - Martin<br>DHCP</center>)
 pi---|1Gb|crowdsec(<center>Martin -Game PC<br><br>10.20.30.151</center>)
 end

subgraph docker1
 docker-.-|1Gb|smokeping(<center>SmokePing<br><br>10.20.30.151</center>)
 docker-.-|1Gb|uptimeKuma(<center>UptimeKuma<br><br>10.20.30.151</center>)
 docker-.-|1Gb|pihole(<center>PI-hole<br><br>10.20.30.151</center>)
 docker-.-|1Gb|wireguardvpn(<center>Wireguard-vpn<br><br>10.20.30.151</center>)
 
 end
 ```