terraform {
    backend "s3" {
        bucket = "terraform-project1"
        key = "dev/tfstate.tf"
        region = "us-east-1"
    }
}