provider "aws" {
  region = var.region
}

# Create ECR Repository for Docker image
resource "aws_ecr_repository" "app_repo" {
  name = "my-python-app-2"
}

# Create EKS Cluster using terraform-aws-modules/eks
module "eks" {
  source  = "terraform-aws-modules/eks/aws"
  version = "19.21.0"

  cluster_name    = var.cluster_name
  cluster_version = var.cluster_version
  subnet_ids      = var.subnet_ids
  vpc_id          = var.vpc_id

  cluster_endpoint_public_access  = true   
  cluster_endpoint_private_access = false

  eks_managed_node_groups = {
    default = {
      desired_size   = var.desired_size
      max_size       = var.max_size
      min_size       = var.min_size
      instance_types = var.instance_types
    }
  }

  enable_irsa        = true

  tags = {
    Environment = "dev"
    Terraform   = "true"
  }
}
terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"  # must be v5.x or above
    }
  }

  required_version = ">= 1.3"
}

