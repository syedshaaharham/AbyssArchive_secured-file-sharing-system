variable "vpc_id" {}
variable "vpc_cidr" {}
variable "public_subnet_ids" { type = list(string) }
variable "private_subnet_ids" { type = list(string) }
variable "db_subnet_ids" { type = list(string) }
variable "project_name" {}
variable "environment" {}
variable "db_port" {}