provider "aws" {
  region = var.region
}

module "s3" {
  source         = "/home/suphotio/Terraform/lab-terraform-aws/modules/s3_bucket"
  environment    = var.environment
  bucket_suffix  = "lab-terraform-aws"
}

