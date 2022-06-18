module "vpc-prd" {
    source = "../../Resources/vpc"
    vpc_cidr     = "10.20.0.0/16"
    subnet_cidr_1  = "10.20.0.0/24"
    subnet_cidr_2  = "10.20.16.0/24"
    project_name     = "prd-website"
    project_name_1 = "prd-website-1"
    project_name_2 = "prd-website-2"
}

module "asg-prd" {
    source = "../../Resources/asg"
    project_name     = "prd-website"
    ami              = "ami-0022f774911c1d690"
    instance_type    = "t2.medium"
    desired_capacity = "3"
    id_subnet        = module.vpc-prd.id_subnet
    id_vpc           = module.vpc-prd.id_vpc
    target_group_arns = module.alb-prd.target_group_arns
}

module "alb-prd" {
    source = "../../Resources/load-balancer"
    project_name     = "prd-website"
    id_vpc           = module.vpc-prd.id_vpc
    id_subnet        = module.vpc-prd.id_subnet
}