terraform {
  # To use s3 as remote backend, use the "aws configure" locally to setup the access key / secret key
  # This authentication should be same access to run the terraform script
  # Also, beforehand, setup the bucket first.
  backend "s3" {
    bucket = "terraform-state-2834afd2"
    key = "terraform/demo4"
  }
}