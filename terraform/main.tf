provider "aws" {
  region = "ap-south-1"
}

# Create ECR repo to store Docker images
resource "aws_ecr_repository" "app_repo" {
  name = "my-python-app"
}

# Create EKS Cluster
module "eks" {
  source          = "terraform-aws-modules/eks/aws"
  version         = "19.21.0"

  cluster_name    = "my-eks-cluster"
  cluster_version = "1.27"  subnet_ids      = ["subnet-082448f700d79379e", "subnet-096e71c1b570c253c"] 
  vpc_id          = "vpc-0f27864949188e468"  

  eks_managed_node_groups = {
    default = {
      desired_size    = 2
      max_size        = 3
      min_size        = 1
      instance_types  = ["t3.medium"]
    }
  }

  # Optional for public access
  enable_irsa = true
  manage_aws_auth = true
}

