# Home Lab - Docomentation. 

* 123
* 123

Here is a simple flow chart:

```mermaid
graph TD;
    A-->B;
    A-->C;
    B-->D;
    C-->D;
```

```mermaid
graph TD
 linkStyle default interpolate basis
 wan1[<center>DSL 1000/300 Mb<br><br>80.167.181.49</center>]---router{<center>EdgeRouter-X<br><br>192.168.0.1</center>}
 ip((<center><br>IP<br><br></center>))-.-router
 dns((<center><br>DNS<br><br></center>))-.-router
 router---|1Gb|switch1[<center>TL-SG105E<br><br>10.20.30.2</center>]
 router---|1Gb|ac[<center>Asus-Martin<br><br>10.20.30.2</center>]
 
 subgraph red2
 switch1---|1Gb|pi(<center>RPi 3B<br><br>10.20.30.150</center>)
 switch1---|1Gb|work(<center>RA: Work-Laptop<br><br>10.20.30.151</center>)
 switch1---|1Gb|work-lab(<center>RA: Work-Laptop2<br><br>10.20.30.170</center>)
 end
 

 subgraph red2
 ac---|1Gb|chromecast(<center>Chromecast - Martin<br><br>10.20.30.150</center>)
 ac---|1Gb|game-pc(<center>Martin -Game PC<br><br>10.20.30.151</center>)
 end
 ```