module "vpc-prd" {
    source = "../../Resources/vpc"
    vpc_cidr     = "10.20.0.0/16"
    subnet_cidr  = "10.20.0.0/24"
    project_name = "prd-website"
}

