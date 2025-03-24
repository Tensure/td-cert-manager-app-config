#!/usr/bin/env demosh

echo "Welcome to the demo!"

read -p "Press enter to continue"

# Run a Kubernetes command
kubectl get pods -n tensure

read -p "Press enter to continue"

# Wait for user to continue (press ENTER)
echo "Now let's describe a ingress"

read -p "Press enter to continue"

# Run another command
kubectl describe ingress demo-ingress -n tensure

read -p "Press enter to continue"

# Automatically execute after 2 seconds
sleep 2

echo "run automatically"

read -p "Press enter to continue"

kubectl get certificate -n tensure
