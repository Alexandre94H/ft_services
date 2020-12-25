#start kubernetes
microk8s start
microk8s enable dns dashboard
microk8s kubectl wait --for=condition=AVAILABLE -n kube-system deployment.apps/kubernetes-dashboard

#build docker and start a deployment 
for d in srcs/* ; do
	docker build $d -t $d:local
	docker save $d > temp.tar
	microk8s ctr image import temp.tar
	rm -f temp.tar
	microk8s kubectl apply -f $d/deployment.yaml
done

#display token
token=$(microk8s kubectl -n kube-system get secret | grep default-token | cut -d " " -f1)
microk8s kubectl -n kube-system describe secret $token | grep token:

#open proxy
# xdg-open https://127.0.0.1:10443/
microk8s kubectl port-forward -n kube-system service/kubernetes-dashboard 10443:443