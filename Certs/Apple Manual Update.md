Transfer the System Root certificates from another Mac

On a newer Mac, launch **Keychain Access**, select **System Roots**, select all the certificates, click the menu ``File, Export``, and export them as ``rootcerts.pem`` file. This file will contain all the certificates concatenated.

Copy the rootcerts.pem file to the old Mac

Create this script:
```
#!/bin/bash
DIR=${TMPDIR}/trustroot.$$
mkdir -p ${DIR}
trap "rm -rf ${DIR}" EXIT
cat "$1" | (cd $DIR && /usr/bin/split -p '-----BEGIN CERTIFICATE-----' - cert- )
for c in ${DIR}/cert-* ; do
   security -v add-trusted-cert -d -r trustRoot -k "/Library/Keychains/System.keychain" "$c"
done
rm -rf ${DIR}
```

(Make script executable: chmod 755 import-trustedroot)

sudo ./trustroot rootcerts.pem

The script splits the .pem file into a number of certificates in the temporary directory, then adds them as TrustRoot certificates to the System key chain. You cannot add them to the System Roots keychain as that can only be updated by the operating system.


MacPorts have a port (apple-pki-bundle) which installs .pem file containing a bunch of certificates downloaded from Apple, GeoTrust and DigiCert. [Source here](https://github.com/macports/macports-ports/blob/master/net/apple-pki-bundle/Portfile). 

-----

for console applications. I believe most of them are curl-based, and here is what you can do:

make a backup for /etc/ssl/cert.pem file
open /etc/ssl/cert.pem with your favorite editor (sudo vim /etc/ssl/cert.pem, for example)
search for DST Root CA X3. If you found this (already expired) root cert - this is the root of the problem
delete this cert. All 42 lines of cert starting ### Digital Signature Trust Co. to -----END CERTIFICATE-----
check if it's ok now with curl --cert-status https://example.com command (replace domain with real one, ofc)
Why it helps. For compatibility reasons LE certs have two ways to root cert. For some reason(compatibility?) validation path with "DST Root CA X3" cert is preferred one. And, as far as I understood, curl is preferring its own set of root certs (instead of System ones) which are located at /etc/ssl/cert.pem. So removing stale root cert forces curl to use "ISRG Root X1"(if it's already there, ofc). NB!

(https://apple.stackexchange.com/a/468770/499759)
