Mac
Windows

https://github.com/Computer-Tsu/Reusable

deprecated

check current enabled options
(link to script)

List of currently supported options
(link to MS doc)

-----

inetcpl.cpl

Advanced<br>
Security<br>
Enable insecure TLS server compatibility
Use SSL 3.0
Use TLS 1.0
Use TLS 1.1
Use TLS 1.2
Use TLS 1.3


Setting the specific Cipher Suite
[System.Net.ServicePointManager]::SecurityProtocol = [System.Net.SecurityProtocolType]::Tls12;

-----

Edge browser error msg


ssh ubnt@192.168.1.20
Unable to negotiate with 192.168.1.20 port 22: no matching key exchange method found. Their offer: diffie-hellman-group1-sha1

