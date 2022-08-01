if ! [ -x "$(command -v kubectl)" ]; then
  echo "Installing kubectl ..."
  sudo apt-get update
  sudo apt-get install -y ca-certificates curl
  sudo apt-get install -y apt-transport-https
  sudo curl -fsSLo /usr/share/keyrings/kubernetes-archive-keyring.gpg https://packages.cloud.google.com/apt/doc/apt-key.gpg
  echo "deb [signed-by=/usr/share/keyrings/kubernetes-archive-keyring.gpg] https://apt.kubernetes.io/ kubernetes-xenial main" | sudo tee /etc/apt/sources.list.d/kubernetes.list
  sudo apt-get update
  sudo apt-get install -y kubectl
else
  echo "👍 ubectl is already installed!"
fi

if ! [ -x "$(command -v kvm)" ]; then
  echo "Installing kvm ..."
  sudo apt install -y qemu-kvm libvirt-daemon-system libvirt-clients bridge-utils virtinst virt-manager
  sudo usermod -aG libvirt $USER
  sudo usermod -aG kvm $USER
else
  echo "👍 kvm is already installed!"
fi

if ! [ -x "$(command -v minikube)" ]; then
  echo "Installing minikube ..."
  curl -LO https://storage.googleapis.com/minikube/releases/latest/minikube-linux-amd64
  sudo install minikube-linux-amd64 /usr/local/bin/minikube
else
  echo "👍 minikube is already installed!"
fi

echo "Configuring minikube ..."
minikube config set cpus 4
minikube config set memory 2g
minikube config set disk-size 50g
minikube config set EmbedCerts true
minikube config set driver kvm2

echo "Starting minikube ..."
minikube start
minikube addons enable ingress
kubectl cluster-info

echo "Setting variables ..."
export TF_VAR_minio_root_access_key="minioadmin" TF_VAR_minio_root_secret_key="minioadmin"
export TF_VAR_minio_s3www_access_key="s3wwwadmin" TF_VAR_minio_s3www_secret_key="s3wwwadmin"
echo "👍 done."
