# Convert Certificates to Other Formats

## Convert To DER

DER a binary form of PEM. It has extension .der or .cer. DER is typically used with Java platforms.

### Convert PEM to DER

`openssl x509 -outform der -in certificate.pem -out certificate.der`




## CONVERT PKCS#7 OR P7B FORMAT

P7B formatted file is usually stored in Base64 format and has extension .p7b or .p7c. Files in this format contain lines "-----BEGIN PKCS7-----" and "-----END PKCS7-----". This format is just for certificates, not for private keys.

PKCS#7 and P7B are installed on Microsoft Windows and Java Tomcat servers.



### Convert PEM to P7B

`openssl crl2pkcs7 -nocrl -certfile certificate.cer -out certificate.p7b -certfile CACert.cer`

## Convert to PFX

### Convert PEM to PFX

`openssl pkcs12 -export -out certificate.pfx -inkey privateKey.key -in certificate.crt -certfile CACert.crt`

`openssl pkcs12 -export -in certificate.cer -inkey privateKey.key -out certificate.pfx -certfile CACert.cer`


### Convert P7B to PFX

`openssl pkcs7 -print_certs -in certificate.p7b -out certificate.cer`


CONVERT FROM PKCS#12 OR PFX FORMAT

PFX is a binary format storing the server certificate, intermediates certificates, and private key in one file. It usually has the extension .pfx or .p12. Typically, these are used on Windows machines.

## Convert to PEM

When converting PFX format to PEM, one file will include all certificates and the private key.

To separate it, you need to open this file in a simple text editor, copy every single part (with BEGIN and END lines) to different files and save it as certificate.cer, CACert.cer and privatekey.key.

### Convert DER to PEM

`openssl x509 -inform der -in certificate.cer -out certificate.pem`


### Convert PFX to PEM

`openssl pkcs12 -in certificate.pfx -out certificate.cer -nodes`

### Convert P7B to PEM

`openssl pkcs7 -print_certs -in certificate.p7b -out certificate.cer`


