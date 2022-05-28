module "vpc-dev" {
    source = "../../Resources/vpc"
    vpc_cidr     = "10.0.0.0/16"
    subnet_cidr  = "10.0.0.0/24"
    project_name = "dev-website"
}

