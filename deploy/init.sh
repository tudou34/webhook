#!/bin/bash

set -e

cd $(dirname $0)/..

kubectl create -f deploy/ns.yaml

./deploy/generateCA.sh --service mywebhook-svc --secret mywebhook-secret --namespace xiong

cat deploy/webhooktpl.yaml | deploy/cabundle.sh > deploy/webhook.yaml

kubectl create -f deploy/deployment.yaml
kubectl create -f deploy/svc.yaml
kubectl create -f deploy/webhook.yaml