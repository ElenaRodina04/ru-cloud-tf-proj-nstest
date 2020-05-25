/***********************************************************************************************************************************
* System variables. Managed by CI
***********************************************************************************************************************************/
# variable "vault_token" {
#   description = "Token to access to Vault store for terraform"
# }

# variable "environment" {
#   description = "Deploying environment"
# }

/***********************************************************************************************************************************
* Cloud deployment
***********************************************************************************************************************************/
variable "cloud_name" {
  description = "Yandex Cloud name for the project"
}

variable "folder_name" {
  description = "Yandex Cloud Folder name for the project"
}

/***********************************************************************************************************************************
* Project deployment
***********************************************************************************************************************************/
variable "labels" {
  type        = map
  description = "Map of lables to set on resource"
}

variable "project_owner_email" {
  description = "Project owner contact email"
}

/***********************************************************************************************************************************
* Infrastructure deployment values
***********************************************************************************************************************************/
variable "zone" {
  description = "Yandex Cloud Zone for provisoned resources"
  default     = "ru-central1-a"
}

variable "instance" {
  type = map(string)
}
