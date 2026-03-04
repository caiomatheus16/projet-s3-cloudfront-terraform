terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }
}

provider "aws" {
  region = var.aws_region
}

module "website" {
  source = "../../modules/s3-cloudfront"

  bucket_name = var.bucket_name
}

output "website_url" {
  value = module.website.website_url
}

output "cloudfront_url" {
  value = module.website.cloudfront_url
}

output "bucket_name" {
  value = module.website.bucket_name
}
