terraform {
    backend "s3" {
        bucket = "terraform-project1"
        key = "stg/tfstate.tf"
        region = "us-east-1"
    }
}