# s3www
s3www deployment in k8s

# Usage
1. Clone the repository
   ```shell
   git clone git@github.com:r-karamad/s3www.git
   ```
2. Initial Setup
Run s3www/prepare.sh to setup Minikube and bootstrap the cluster.
   ```shell
   ./prepare.sh
   ```


Run s3www/etchosts.sh to add required A-records to local hosts file.
Go to s3www/terraform/devlopment and run terraform init
and then terraform apply --auto-approve

Two helm charts are used to deploy the application
1. Minio
2. s3www

Nginx Ingress Contrlller is used.
