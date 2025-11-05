# -----------------------
# VPC Variables
# -----------------------
vpc_cidr_block       = "10.0.0.0/16"
public_subnet_cidrs  = ["10.0.1.0/24", "10.0.2.0/24"]
private_subnet_cidrs = ["10.0.3.0/24", "10.0.4.0/24"]
availability_zones   = ["ap-south-1a", "ap-south-1b"]

# -----------------------
# ECS / Cluster Variables
# -----------------------
cluster_name = "ecommerce-cluster"
ecs_service_name = "ecommerce-backend-service"
ecs_task_family  = "ecommerce-backend-task"
container_name   = "ecommerce-backend"
container_port   = 8080
desired_count    = 2
cpu              = 256
memory           = 512

# -----------------------
# RDS Variables
# -----------------------
db_identifier      = "ecommerce-db"
db_name            = "ecommerce"
db_username        = "admin"
db_password        = "Admin@12345"
db_instance_class  = "db.t3.micro"
db_allocated_storage = 20

# -----------------------
# ALB Variables
# -----------------------
alb_name   = "ecommerce-alb"
health_check_path = "/api/health"

# -----------------------
# S3 Variables
# -----------------------
s3_bucket_name = "ecommerce-project-artifacts-032f73c4"

# -----------------------
# CloudWatch Variables
# -----------------------
log_group_name = "/ecs/ecommerce-backend"
alarm_cpu_threshold = 70
alarm_memory_threshold = 75

# -----------------------
# IAM Variables
# -----------------------
ecs_task_role_name = "ecsTaskExecutionRole"
policy_arn         = "arn:aws:iam::aws:policy/service-role/AmazonECSTaskExecutionRolePolicy"

# -----------------------
# ECR Variables
# -----------------------
ecr_repo_name = "ecommerce-backend-repo"

# -----------------------
# Security Group Variables
# -----------------------
allowed_cidr_blocks = ["0.0.0.0/0"]
