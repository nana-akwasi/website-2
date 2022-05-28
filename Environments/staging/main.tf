module "vpc-stg" {
    source = "../../Resources/vpc"
    vpc_cidr     = "10.10.0.0/16"
    subnet_cidr  = "10.10.0.0/24"
    project_name = "stg-website"
}

