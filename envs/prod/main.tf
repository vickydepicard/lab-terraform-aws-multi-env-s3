provider "aws" {
  region = var.region
}

module "s3" {
  source        = "../../modules/s3_bucket"
  environment    = var.environment
  bucket_suffix  = "lab-terraform-aws"
}

