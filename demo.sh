#!/usr/bin/env demosh

echo "Welcome to the demo! For the manual demonstration of issuance of certificates for kubernetes applications"

read -p "Press enter to continue"

# Run a Kubernetes command
sudo certbot certonly --manual --preferred-challenges=dns -d nginxmanual2.ioinfo.shop

read -p "Press enter to continue"

sudo cp /etc/letsencrypt/live/nginxmanual2.ioinfo.shop/fullchain.pem /Users/vamsikrishna/managebee/td-cert-manager-app-config/manifests/without-cert-manager/manual-nginx-keys/fullchain.crt

sudo cp /etc/letsencrypt/live/nginxmanual2.ioinfo.shop/privkey.pem /Users/vamsikrishna/managebee/td-cert-manager-app-config/manifests/without-cert-manager/manual-nginx-keys/privatekey.key

echo "Copied fullchain certificate and private key to required path"

sudo chown vamsikrishna *

read -p "Press enter to continue"

kubectl create secret tls nginxmanual2-tls --cert=/Users/vamsikrishna/managebee/td-cert-manager-app-config/manifests/without-cert-manager/manual-nginx-keys/fullchain.crt --key=/Users/vamsikrishna/managebee/td-cert-manager-app-config/manifests/without-cert-manager/manual-nginx-keys/privatekey.key -n manual

echo "Next, Go ahead and deploy applications using ArgoCD"