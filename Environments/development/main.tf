module "vpc-dev" {
    source = "../../Resources/vpc"
    vpc_cidr     = "10.0.0.0/16"
    subnet_cidr_1  = "10.0.0.0/24"
    subnet_cidr_2  = "10.0.16.0/24"
    project_name     = "dev-website"
    project_name_1 = "dev-website-1"
    project_name_2 = "dev-website-2"
}

module "asg-dev" {
    source = "../../Resources/asg"
    project_name     = "dev-website"
    ami              = "ami-0022f774911c1d690"
    instance_type    = "t2.small"
    desired_capacity = "2"
    id_subnet        = module.vpc-dev.id_subnet
    id_vpc           = module.vpc-dev.id_vpc
    target_group_arns = module.alb-dev.target_group_arns
}

module "alb-dev" {
    source = "../../Resources/load-balancer"
    project_name     = "dev-website"
    id_vpc           = module.vpc-dev.id_vpc
    id_subnet        = module.vpc-dev.id_subnet
}
