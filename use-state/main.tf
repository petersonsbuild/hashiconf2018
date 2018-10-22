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