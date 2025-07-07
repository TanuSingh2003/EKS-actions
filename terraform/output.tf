output "ecr_url" {
  value = aws_ecr_repository.app_repo.repository_url
}

output "cluster_name" {
  value = module.eks.cluster_name
}

output "cluster_endpoint" {
  value = module.eks.cluster_endpoint
}

output "kubeconfig_certificate_authority_data" {
  value = module.eks.cluster_certificate_authority_data
}

