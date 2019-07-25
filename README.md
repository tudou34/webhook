# Kubernetes Webhook

## build image

1. mv codedir to $GOPATH/src
```
make build
```

2. check image, tag is xiong
```
docker images | grep gcr.io/kubernetes-e2e-test-images/k8s-sample-admission-webhook-amd64
```

then send image to k8s slave nodes using (docker save and docker load) or push image to private repositories(need update deploy/deployment.yaml image)

## init

1. run at a k8s master node
```
./deploy/init.sh

kubectl get po -n xiong | grep mywebhook-deployment
```
wait pod is running status

## verify

```
kubectl create -f deploy/examplepod.yaml

kubectl get po -n xiong -oyaml webhook-example
```

a pause container is added to pod