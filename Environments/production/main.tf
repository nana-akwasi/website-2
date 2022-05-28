module "vpc-prd" {
    source = "../../Resources/vpc"
    vpc_cidr     = "10.20.0.0/16"
    subnet_cidr  = "10.20.0.0/24"
    project_name = "prd-website"
}

module "asg-prd" {
    source = "../../Resources/asg"
    project_name     = "prd-website"
    ami              = "ami-0022f774911c1d690"
    instance_type    = "t2.medium"
    desired_capacity = "3"
    id_subnet        = module.vpc-prd.id_subnet
}