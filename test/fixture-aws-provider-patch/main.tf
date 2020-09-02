provider "aws" {
  region = var.primary_aws_region
}

module "example_module" {
  # TODO: replace the ref with a proper release once this is all merged!
  source = "github.com/gruntwork-io/terragrunt.git//test/fixture-aws-provider-patch/example-module?ref=provider-overwritte"

  secondary_aws_region = var.secondary_aws_region
  bucket_name          = var.bucket_name
}

variable "primary_aws_region" {
  description = "The primary AWS region for this module"
  type        = string
}

variable "secondary_aws_region" {
  description = "The secondary AWS region to deploy the S3 bucket from the module into"
  type        = string
}

variable "bucket_name" {
  description = "The name to use for the S3 bucket"
  type        = string
}