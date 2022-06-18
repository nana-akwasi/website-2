variable "project_name" {
    type = string
}

variable "ami" {
    type = string
}

variable "instance_type" {
    type = string
}

variable "desired_capacity" {
    type = string
}

variable "id_subnet" {
    type = set(string)
}

variable "id_vpc" {
    type = string
}

variable "target_group_arns" {
    type = string
}