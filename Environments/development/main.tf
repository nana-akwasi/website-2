module "vpc-dev" {
    source = "../../Resources/vpc"
    vpc_cidr     = "10.0.0.0/16"
    subnet_cidr  = "10.0.0.0/24"
    project_name = "dev-website"
}

module "asg-dev" {
    source = "../../Resources/asg"
    project_name     = "dev-website"
    ami              = "ami-0022f774911c1d690"
    instance_type    = "t2.small"
    desired_capacity = "2"
    id_subnet        = module.vpc-dev.id_subnet
}
