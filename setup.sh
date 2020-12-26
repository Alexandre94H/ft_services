#start kubernetes
microk8s start
microk8s enable dns dashboard
microk8s kubectl -n kube-system wait --for=condition=AVAILABLE deployment.apps/kubernetes-dashboard

#build docker and start a deployment 
for d in srcs/* ; do
	docker build $d -t $d:local
	docker save $d > temp.tar
	microk8s ctr image import temp.tar
	rm -f temp.tar
	microk8s kubectl apply -f $d/deployment.yaml
done

#display token and endpoint
token=$(microk8s kubectl -n kube-system get secret | grep default-token | cut -d " " -f1)
microk8s kubectl -n kube-system describe secret $token | grep token:
microk8s kubectl -n kube-system describe service/kubernetes-dashboard | grep Endpoints: