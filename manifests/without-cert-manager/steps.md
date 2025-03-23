1. Obtain a certificate from CA.

When obtaining a certificate, you will need a Certificate Signing Request (CSR).

2. generate a csr and a private key

openssl req -new -newkey rsa:2048 -nodes -keyout manualapp.key -out manualapp.csr -subj "/CN=manualapp.ioinfo.shop/O=manualapp"

3. submit the csr with CA to verify domain ownership we shall do with certbot

this will give CA Bundle and pem , merge it to get a fullchain certificate.

option2 :


brew install certbot

sudo certbot certonly --manual --preferred-challenges=dns -d manualapp.ioinfo.shop

Manually perform dns validation ( this will be done by cert-manager )


Post a ingress LB Is created , copy the ingress IP and manually create a record for the domain pointing to this iP ( this will be done by external-dns )
