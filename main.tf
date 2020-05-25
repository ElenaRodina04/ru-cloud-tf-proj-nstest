# to init remote state wothout storing keys use Partial Configuration
# https://www.terraform.io/docs/backends/config.html#partial-configuration
# terraform init -backend-config="access_key=$S3_ACCESS_KEY" -backend-config="secret_key=$S3_SECRET_KEY"
terraform {
  backend "s3" {
    bucket                      = "dkttfstate"
    key                         = "network-dev/terraform.tfstate"
    region                      = "us-east-1"
    endpoint                    = "storage.yandexcloud.net"
    skip_region_validation      = "true"
    skip_credentials_validation = "true"
  }
}

provider "yandex" {
}

data "yandex_resourcemanager_cloud" "decathlon" {
  name = var.cloud_name
}

data "yandex_resourcemanager_folder" "folder" {
  cloud_id = data.yandex_resourcemanager_cloud.decathlon.id
  name     = var.folder_name
}