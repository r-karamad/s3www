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
   sudo ./etchosts.sh
   ```
3. Apply terraform
   ```shell
   cd terraform/development/
   terraform init
   terraform plan
   terraform apply --auto-approve
   ```
4. Change credentials
By default these credentials are configured but it is recommended to change them to more secure values however.
   ```shell
export TF_VAR_minio_root_access_key="minioadmin" TF_VAR_minio_root_secret_key="minioadmin"
export TF_VAR_minio_s3www_access_key="s3wwwadmin" TF_VAR_minio_s3www_secret_key="s3wwwadmin"
   ```shell

Useful links:
https://github.com/bitnami/charts/tree/master/bitnami/minio
