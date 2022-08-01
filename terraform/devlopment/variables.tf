variable namespace {
  type        = string
  description = "Namespace for deployment"
}

variable minio_release_name {
  type        = string
  description = "Minio helm release name"
}

variable minio_bucket_name {
  type        = string
  description = "Minio bucket name"
}

variable minio_repository   {
  type        = string
  description = "Minio helm repostiory"
}

variable minio_chart   {
  type        = string
  description = "Minio helm chart name"
}

variable s3www_release_name {
  type        = string
  description = "s3www helm release name"
}

variable s3www_repository   {
  type        = string
  description = "s3www helm repostiory"
}

variable s3www_chart   {
  type        = string
  description = "s3www helm chart name"
}

variable minio_api_ep {
  type        = string
  description = "Minio api endpoint"
}

variable minio_root_access_key {
  type = string
  description = "Minio root access key"
  sensitive   = true
}

variable minio_root_secret_key {
  type = string
  description = "Minio root secret key"
  sensitive   = true
}

variable minio_s3www_access_key {
  type = string
  description = "Minio s3www access key"
  sensitive   = true
}

variable minio_s3www_secret_key {
  type = string
  description = "Minio s3www secret key"
  sensitive   = true
}

