variable "project_id" {
  description = "The ID of the project in which the resource belongs."
  type        = string
}

variable "region" {
  description = "Region of the subnet and GCE instances"
  type        = string
}

variable "zone" {
  description = "Zone for the GCE instances"
  type        = string
}

variable "rigm_name" {
  description = "Name for the region instance group manager"
  type        = string 
}

variable "base_instance_name" {
  description = "Base instance name to use for instances in the regional instance group"
  type        = string 
}

variable "mig_size" {
  description = "Size of the Managed Instance Group (i.e., number of GCE instances)"
  type        = number
}

variable "instance_template_name" {
  description = "Instance template name"
  type = string
}

variable "subnet" {
  description = "Name of the subnet"
  type        = string
}

variable "service_account" {
  description = "ID of the service account"
  type        = string
}

variable "container_image_path" {
  description = "Path to AutoML Labelling Tool container image"
  type        = string
}

variable "health_check_name" {
  description = "Name for health check for the managed instance group"
  type        = string
}



/*
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
*/
