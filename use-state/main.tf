provider "aws" {
version = "~> 1.16"
}
terraform {
    backend "s3" {
        bucket = "pl-cld-benpeterson-engineering-prod-tfstate"
        key = "use-state.tfstate"
        encrypt = true
    }
}
data "terraform_remote_state" "root" {
    backend = "s3"
    config {
        bucket = "pl-cld-benpeterson-engineering-prod-tfstate"
        key = "root.tfstate"
    }
}