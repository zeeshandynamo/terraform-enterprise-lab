terraform {
  backend "s3" {
    bucket         = "zeeshandynamo-terraform-state-ap-south-1"
    key            = "terraform-enterprise-lab/dev/terraform.tfstate"
    region         = "ap-south-1"
    dynamodb_table = "terraform-state-lock"
    encrypt        = true
  }
}
