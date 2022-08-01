# s3www
s3www deployment in k8s

# Usage
1. Clone the repository
   ```shell
   git clone git@github.com:r-karamad/s3www.git && cd s3www
   ```
2. Initial Setup and update /etc/hosts
   ```shell
   ./prepare.sh
   ```
   ```shell
   sudo ./etchosts.sh
   ```
3. Apply terraform
   ```shell
   cd ./terraform/development
   terraform init
   terraform plan
   terraform apply --auto-approve
   ```

