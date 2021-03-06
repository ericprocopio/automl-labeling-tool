variable "credentials_path" {
  description = "File path of the service account credentials for Terraform"
  type        = string
}

variable "billingAccount" {
  description = "The ID of the billing account to associate this project with"
  type        = string
}

variable "organizationID" {
  description = "The organization ID."
  type        = string
}

variable "folderID" {
  description = "The ID of a folder to host this project"
  type        = string
  default     = ""
}

variable "shared_vpc" {
  description = "The ID of the host project which hosts the shared VPC"
  type        = string
  default     = ""
}

variable "python_interpreter_path" {
  description = "Python interpreter path for precondition check script."
  type        = string
  default     = "python3"
}

variable "pip_executable_path" {
  description = "Pip executable path for precondition requirements.txt install."
  type        = string
  default     = "pip3"
}

variable "impersonate_service_account" {
  description = "An optional service account to impersonate. If this service account is not specified, Terraform will fall back to credential file or Application Default Credentials."
  type        = string
  default     = ""
}

variable "auto_create_network" {
  description = "Create the default network"
  type        = bool
  default     = false
}

variable "name" {
  description = "The name for the project"
  type        = string
}

variable "project_id" {
  description = "The ID to give the project. If not provided, the `name` will be used."
  type        = string
  default     = ""
}

variable "random_project_id" {
  description = "Adds a suffix of 4 random characters to the `project_id`"
  type        = bool
  default     = false
}

variable "labels" {
  description = "Map of labels for project"
  type        = map(string)
  default     = {}
}


variable "enable_apis" {
  description = "Whether to actually enable the APIs. If false, this module is a no-op."
  default     = "false"
}

variable "activate_apis" {
  description = "The list of apis to activate within the project"
  type        = list(string)
}

variable "disable_services_on_destroy" {
  description = "Whether project services will be disabled when the resources are destroyed. https://www.terraform.io/docs/providers/google/r/google_project_service.html#disable_on_destroy"
  default     = "true"
  type        = string
}

variable "disable_dependent_services" {
  description = "Whether services that are enabled and which depend on this service should also be disabled when this service is destroyed. https://www.terraform.io/docs/providers/google/r/google_project_service.html#disable_dependent_services"
  default     = "true"
  type        = string
}

variable "sa_roles" {
  description = "A role to give the default Service Account for the project (defaults to none)"
  type        = list(string)
  default     = []
}

variable "group_emails" {
  description = "The email address of a group to control the project by being assigned group_role."
  type        = list(string)
  default     = []
}

variable "member_attributes" {
  description = "The role to give the controlling group (group_name) over the project."
  type = map(object({
    roles = list(string)
  }))
}
