module "vpc-stg" {
    source = "../../Resources/vpc"
    vpc_cidr     = "10.10.0.0/16"
    subnet_cidr_1  = "10.10.0.0/24"
    subnet_cidr_2  = "10.10.16.0/24"
    project_name     = "stg-website"
    project_name_1 = "stg-website-1"
    project_name_2 = "stg-website-2"
}

module "asg-stg" {
    source = "../../Resources/asg"
    project_name     = "stg-website"
    ami              = "ami-0022f774911c1d690"
    instance_type    = "t2.micro"
    desired_capacity = "2"
    id_subnet        = module.vpc-stg.id_subnet
    id_vpc           = module.vpc-stg.id_vpc
    target_group_arns = module.alb-stg.target_group_arns
}

module "alb-stg" {
    source = "../../Resources/load-balancer"
    project_name     = "stg-website"
    id_vpc           = module.vpc-stg.id_vpc
    id_subnet        = module.vpc-stg.id_subnet
}