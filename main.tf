data "aws_caller_identity" "current" {}

module "vpc" {
  source = "./modules/vpc"

  project_name         = var.project_name
  environment          = var.environment
  vpc_cidr             = var.vpc_cidr
  public_subnet_cidrs  = var.public_subnet_cidrs
  private_subnet_cidrs = var.private_subnet_cidrs
  db_subnet_cidrs      = var.db_subnet_cidrs
}

module "security" {
  source = "./modules/security"

  vpc_id               = module.vpc.vpc_id
  vpc_cidr             = var.vpc_cidr
  public_subnet_ids    = module.vpc.public_subnet_ids
  private_subnet_ids   = module.vpc.private_subnet_ids
  db_subnet_ids        = module.vpc.db_subnet_ids
  project_name         = var.project_name
  environment          = var.environment
  db_port              = var.db_port
}

module "logging" {
  source = "./modules/logging"

  vpc_id        = module.vpc.vpc_id
  project_name  = var.project_name
  environment   = var.environment
  account_id    = data.aws_caller_identity.current.account_id
}