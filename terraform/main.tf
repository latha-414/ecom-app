terraform {
  required_version = ">= 1.5.0"

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }

  backend "s3" {
    bucket = "ecommerce-terraform-state-bucket"
    key    = "terraform/state.tfstate"
    region = "ap-south-1"
  }
}

provider "aws" {
  region = var.region
}

# ──────────────────────────────
# 1️⃣ VPC MODULE
# ──────────────────────────────
module "vpc" {
  source       = "./modules/vpc"
  project_name = var.project_name
  region       = var.region
  environment  = var.environment
}

# ──────────────────────────────
# 2️⃣ SECURITY MODULE
# ──────────────────────────────
module "security" {
  source        = "./modules/security"
  project_name  = var.project_name
  vpc_id        = module.vpc.vpc_id
  backend_port  = var.backend_port
}

# ──────────────────────────────
# 3️⃣ IAM MODULE
# ──────────────────────────────
module "iam" {
  source       = "./modules/iam"
  project_name = var.project_name
}

# ──────────────────────────────
# 4️⃣ ECR MODULE
# ──────────────────────────────
module "ecr" {
  source       = "./modules/ecr"
  project_name = var.project_name
  environment  = var.environment
}

# ──────────────────────────────
# 5️⃣ RDS MODULE
# ──────────────────────────────
module "rds" {
  source        = "./modules/rds"
  project_name  = var.project_name
  db_username   = var.db_username
  db_password   = var.db_password
  vpc_id        = module.vpc.vpc_id
  private_subnets = module.vpc.private_subnets
}

# ──────────────────────────────
# 6️⃣ ECS MODULE
# ──────────────────────────────
module "ecs" {
  source                     = "./modules/ecs"
  project_name               = var.project_name
  environment                = var.environment
  vpc_id                     = module.vpc.vpc_id
  private_subnets            = module.vpc.private_subnets
  ecs_task_execution_role_arn = module.iam.ecs_task_execution_role_arn
  backend_port               = var.backend_port
  frontend_port              = var.frontend_port
  backend_repo_url           = module.ecr.backend_repo_url
  frontend_repo_url          = module.ecr.frontend_repo_url
  ecs_sg_id                  = module.security.ecs_sg_id
}

# ──────────────────────────────
# 7️⃣ ALB MODULE
# ──────────────────────────────
module "alb" {
  source        = "./modules/alb"
  project_name  = var.project_name
  vpc_id        = module.vpc.vpc_id
  public_subnets = module.vpc.public_subnets
  alb_sg_id     = module.security.alb_sg_id
  target_group_arn_backend  = module.ecs.backend_tg_arn
  target_group_arn_frontend = module.ecs.frontend_tg_arn
}

# ──────────────────────────────
# 8️⃣ S3 MODULE
# ──────────────────────────────
module "s3" {
  source        = "./modules/s3"
  project_name  = var.project_name
  environment   = var.environment
}

# ──────────────────────────────
# 9️⃣ CLOUDWATCH MODULE
# ──────────────────────────────
module "cloudwatch" {
  source          = "./modules/cloudwatch"
  project_name    = var.project_name
  ecs_cluster_arn = module.ecs.ecs_cluster_arn
  region          = var.region
}
