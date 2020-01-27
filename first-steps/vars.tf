variable "AWS_ACCESS_KEY" {}
variable "AWS_SECRET_KEY" {}
variable "AWS_REGION" {
  default = "eu-west-1"
}

variable "AMIS" {
  type = map(string)
  default = {
    "us-east-1" = "ami-0bfb5f753b6c2d30b"
    "us-east-2" = "ami-0bf3d772090752dc5"
    "eu-west-1" = "ami-0b508e9b54730f606"
  }
}
