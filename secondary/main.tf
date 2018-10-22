# secondary/main.tf
# Read state from another Terraform config’s state
data "terraform_remote_state" "primary" {
backend = "local"
config {
path = "../primary/terraform.tfstate"
}
}