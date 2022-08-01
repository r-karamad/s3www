# s3www
s3www deployment in k8s

# Usage
1. Clone the repository
   ```shell
   git clone git@github.com:r-karamad/s3www.git
   ```
2. Initial Setup
   ```shell
   ./s3www/prepare.sh
   ./s3www/etchosts.sh
   ```
3. Apply terraform
   ```shell
   cd ./s3www/terraform/development
   terraform init
   terraform plan
   terraform apply --auto-approve
   ```

