module "vpc-stg" {
    source = "../../Resources/vpc"
    vpc_cidr     = "10.10.0.0/16"
    subnet_cidr  = "10.10.0.0/24"
    project_name = "stg-website"
}

module "asg-stg" {
    source = "../../Resources/asg"
    project_name     = "stg-website"
    ami              = "ami-0022f774911c1d690"
    instance_type    = "t2.micro"
    desired_capacity = "2"
    id_subnet        = module.vpc-stg.id_subnet
}

module "alb-stg" {
    source = "../../Resources/load-balancer"
    project_name     = "stg-website"
    id_vpc           = module.vpc-stg.id_vpc
    id_subnet        = module.vpc-stg.id_subnet
}