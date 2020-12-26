#start kubernetes
microk8s start
ip=$(hostname -I | cut -d " " -f1)
microk8s enable metallb:$ip-$ip
microk8s enable dns dashboard
microk8s kubectl -n kube-system wait --for=condition=AVAILABLE deployment.apps/kubernetes-dashboard

#build docker and start a deployment 
for path in srcs/* ; do
	folder=$(echo "$path" | cut -d "/" -f2)
	docker build $path -t $folder:local
	docker save $folder > temp.tar
	microk8s ctr image import temp.tar
	rm -f temp.tar
	microk8s kubectl apply -f $path/deployment.yaml
done

#display token and endpoint
token=$(microk8s kubectl -n kube-system get secret | grep default-token | cut -d " " -f1)
microk8s kubectl -n kube-system describe secret $token | grep token:
microk8s kubectl -n kube-system describe service/kubernetes-dashboard | grep Endpoints: