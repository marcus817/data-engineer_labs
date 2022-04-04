variable "aws_region" {
  default = "us-east-2"
}

variable "bbucket_name" {
  default = "ms-datalake"
}

variable "camada" {
  default = "raw"
}

variable "ambiente" {
  default = "producao-raw"
}

variable "nr_conta" {
  default = "336272671020"
}

#Centralizar o arquivo de controle de estado do Terraform
terraform {
  backend "s3" {
    bucket  = "terraform-state-delabs-ms"
    key     = "state/delabs/01/terraform.tfstate" 
    region  = "us-east-2"
  }
}