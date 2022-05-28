terraform {
    backend "s3" {
        bucket = "terraform-project1"
        key = "prd/tfstate.tf"
        region = "us-east-1"
    }
}