1. Obtain a certificate from CA.

When obtaining a certificate, you will need a Certificate Signing Request (CSR).

2. generate a csr and a private key

openssl req -new -newkey rsa:2048 -nodes -keyout manualapp.key -out manualapp.csr -subj "/CN=manualapp.ioinfo.shop/O=manualapp"

3. submit the csr with CA to verify domain ownership we shall do with certbot

this will give CA Bundle and pem , merge it to get a fullchain certificate.


option2 :


brew install certbot

sudo certbot certonly --manual --preferred-challenges=dns -d nginxmanual2.ioinfo.shop

Manually perform dns validation ( this will be done by cert-manager )

sudo cp /etc/letsencrypt/live/nginxmanual2.ioinfo.shop/fullchain.pem /Users/vamsikrishna/managebee/td-cert-manager-app-config/manifests/without-cert-manager/manual-nginx-keys/fullchain.crt

sudo cp /etc/letsencrypt/live/nginxmanual2.ioinfo.shop/privkey.pem /Users/vamsikrishna/managebee/td-cert-manager-app-config/manifests/without-cert-manager/manual-nginx-keys/privatekey.key

sudo chown vamsikrishna *

kubectl create secret tls nginxmanual2-tls --cert=fullchain.crt --key=privatekey.key -n manual

Post a ingress LB Is created , copy the ingress IP and manually create a record for the domain pointing to this iP ( this will be done by external-dns )


