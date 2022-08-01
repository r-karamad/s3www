echo "Setting /etc/hosts ..."
minikube_ip=$(cat minikube_ip)
sudo sed -i '/app1.cluster.local/d' /etc/hosts
sudo sed -i '/con.minio.cluster.local/d' /etc/hosts
sudo sed -i '/api.minio.cluster.local/d' /etc/hosts
sudo echo $minikube_ip app1.cluster.local >> /etc/hosts
sudo echo $minikube_ip con.minio.cluster.local >> /etc/hosts
sudo echo $minikube_ip api.minio.cluster.local >> /etc/hosts
echo "👍 done."