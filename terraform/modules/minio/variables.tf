variable namespace {
  type        = string
  description = "Namespace for deployment"
}

variable minio_release_name {
  type        = string
  description = "Minio helm release name"
}

variable minio_api_ep {
  type        = string
  description = "Minio api endpoint"
}

variable minio_bucket_name {
  type        = string
  description = "Minio bucket name"
}

variable minio_root_access_key {
  type = string
  description = "Minio root access key"
}

variable minio_root_secret_key {
  type = string
  description = "Minio root secret key"
}

variable minio_s3www_access_key {
  type = string
  description = "Minio s3www access key"
}

variable minio_s3www_secret_key {
  type = string
  description = "Minio s3www secret key"
}

