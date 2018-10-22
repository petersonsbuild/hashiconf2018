# create-s3-bucket/main.tf
provider "aws" {
    version = "~> 1.16"
}
terraform {
backend "s3" {
    bucket = "pl-cld-benpeterson-engineering-prod-tfstate"
    key = "root.tfstate"
    encrypt = true
}
}
variable "namespace" {
    default = "pl-cld-benpeterson"
}
resource "aws_s3_bucket" "tfstate_store" {
    bucket = "${var.namespace}-engineering-prod-tfstate"
    acl = "private"
    force_destroy = true
    versioning {
        enabled = true
    }
    logging {
        target_bucket = "${aws_s3_bucket.logs.id}"
        target_prefix = "log/"
    }
}
resource "aws_s3_bucket" "logs" {
    bucket = "${var.namespace}-engineering-prod-tfstate-logs"
    acl = "log-delivery-write"
}
output "public_ip" {
value = "8.8.8.8"
}