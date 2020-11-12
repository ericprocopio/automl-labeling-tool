variable "project" {
    description = "ID of project in which to place the network resources"
    type        = string
}

variable "vpc_name" {
    description = "Name of the VPC"
    type        = string
}

variable "subnet_name" {
    description = "Name of the subnet"
    type        = string
}

variable "subnet_region" {
    description = "Region of the subnet"
    type        =  string
}

variable "cidr_range" {
    description = "CIDR range for the subnet"
    type        = string
}