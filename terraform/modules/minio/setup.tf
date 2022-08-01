
resource "null_resource" "minio_set_alias" {
  provisioner "local-exec" {
    command                   = "mc alias set local ${var.minio_api_ep} ${var.minio_root_access_key} ${var.minio_root_secret_key}"
  }
}

resource "null_resource" "minio_add_bucket" {
  provisioner "local-exec" {
    command                   = "mc mb local/s3www"
  }
  depends_on                = [null_resource.minio_set_alias]
}

resource "null_resource" "minio_upload" {
  provisioner "local-exec" {
    command                   = "mc cp --recursive ../modules/minio/static_files/ local/s3www"
  }
  depends_on                  = [null_resource.minio_add_bucket]
}

resource "null_resource" "minio_add_user" {
  provisioner "local-exec" {
    command                   = "mc admin user add local ${var.minio_s3www_access_key} ${var.minio_s3www_secret_key}"
  }
  depends_on                = [null_resource.minio_set_alias]
}

resource "null_resource" "minio_set_user_policy" {
  provisioner "local-exec" {
    command                   = "mc admin policy set local readwrite user=${var.minio_s3www_access_key}"
  }
  depends_on                = [null_resource.minio_add_user]
}

