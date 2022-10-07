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
 router---|1Gb|switch2[<center>TL-SG105E<br><br>10.20.30.2</center>]
 
 subgraph red2
 switch1---|100Mb|pi1(<center>RPi 3B<br><br>10.20.30.150</center>)
 switch1---|1Gb|pi2(<center>RPi 3B+<br><br>10.20.30.151</center>)
 switch1---|100Mb|nvr(<center>NVR<br><br>10.20.30.170</center>)
 switch1---|1Gb|laptop(<center>Laptop<br><br>10.20.30.192</center>)
 end
 

 subgraph red2
 switch2---|100Mb|pi1(<center>RPi 3B<br><br>10.20.30.150</center>)
 switch2---|1Gb|pi2(<center>RPi 3B+<br><br>10.20.30.151</center>)
 switch2---|100Mb|nvr(<center>NVR<br><br>10.20.30.170</center>)
 switch2---|1Gb|laptop(<center>Laptop<br><br>10.20.30.192</center>)
 end
 ```