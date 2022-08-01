
resource "helm_release" "minio" {
  name                        = var.minio_release_name
  repository                  = var.minio_repository
  chart                       = var.minio_chart
  namespace                   = var.namespace
  create_namespace            = true
  set {
    name                      = "auth.rootUser"
    value                      = var.minio_root_access_key
  }
  set {
    name                       = "auth.rootPassword"
    value                      = var.minio_root_secret_key

  }
}

data "kubernetes_service" "ingress_svc" {
  metadata {
    name = "ingress-nginx-controller"
    namespace = "ingress-nginx"
  }
}

resource "helm_release" "s3www" {
  name                        = var.s3www_release_name
  repository                  = var.s3www_repository
  chart                       = var.s3www_chart
  namespace                   = var.namespace
  set {
    name                      = "minio.service"
    value                     = var.minio_release_name
  }
  set {
    name                      = "deployment.minio.accessKey"
    value                      = var.minio_s3www_access_key
  }
  set {
    name                       = "deployment.minio.secretKey"
    value                      = var.minio_s3www_secret_key

  }
  depends_on                  = [helm_release.minio]
}

module minio_setup {
  source                      = "../modules/minio"
  minio_api_ep                = "${var.minio_api_ep}:${data.kubernetes_service.ingress_svc.spec[0].port.0.node_port}"
  minio_bucket_name           = var.minio_bucket_name
  minio_release_name          = var.minio_release_name
  namespace                   = var.namespace
  minio_root_access_key       = var.minio_root_access_key
  minio_root_secret_key       = var.minio_root_secret_key
  minio_s3www_access_key       = var.minio_s3www_access_key
  minio_s3www_secret_key       = var.minio_s3www_secret_key
  depends_on                  = [helm_release.s3www]
}

output "homepage" {
  value = "http://app1.cluster.local:${data.kubernetes_service.ingress_svc.spec[0].port.0.node_port}"
  depends_on = [module.minio_setup]
}