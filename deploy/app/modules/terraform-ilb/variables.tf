variable "project_id" {
  description = "The ID of the project in which the resource belongs."
  type        = string
}

variable "network" {
  description = "Name of the network"
  type        = string
}

variable "subnet" {
  description = "Name of the subnet"
  type        = string
}

variable "proxy_subnet" {
  description = "Name of the subnet for the ILb proxies"
  type        = string
}

variable "region" {
  description = "Region of the subnet and GCE instances"
  type        = string
}

variable "instance_group_name" {
  description = "Managed instance group name"
  type        = string
}

variable "http_proxy_name" {
  description = "Name for the HTTP proxy"
  type        = string
}

variable "url_map_name" {
  description = "Name for the URL map"
  type        = string
}

variable "automl_backend" {
  description = "Name for the Managed Instance Group Backend Service"
  type        = string
}

variable "automl_ilb_health_check" {
  description = "Name for the Health Check"
  type        = string
}