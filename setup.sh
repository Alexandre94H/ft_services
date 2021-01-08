#start kubernetes
microk8s start
ip=$(hostname -I | cut -d " " -f1)
microk8s enable metallb:$ip-$ip dns dashboard

#build docker and start a deployment 
for path in srcs/* ; do
	folder=$(echo "$path" | rev | cut -d "/" -f1 | rev)
	docker build $path -t $folder:local
	docker save $folder > temp.tar
	microk8s ctr image import temp.tar
	rm -f temp.tar
	sed "s/<ip>/$ip/g" $path/deployment.yaml > temp.yaml
	microk8s kubectl apply -f temp.yaml
	rm -f temp.yaml
done

#waiting dashboard ready
microk8s kubectl -n kube-system wait --for=condition=AVAILABLE deployment.apps/kubernetes-dashboard

#display token and endpoint
token=$(microk8s kubectl -n kube-system get secret | grep default-token | cut -d " " -f1)
microk8s kubectl -n kube-system describe secret $token | grep token:
microk8s kubectl -n kube-system describe service/kubernetes-dashboard | grep Endpoints: