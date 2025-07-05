variable "cluster_name" {
  description = "Name of the EKS cluster"
  type        = string
  default     = ""
}

variable "vpc_id" {
  description = "ID of the VPC where the cluster security group will be provisioned"
  type        = string
  default     = null
}

variable "cluster_oidc_issuer_url" {
  type        = string
  description = "The OIDC issuer URL from the EKS cluster"
}

variable "aws_region" {
  type    = string
  default = "us-east-1"
}
