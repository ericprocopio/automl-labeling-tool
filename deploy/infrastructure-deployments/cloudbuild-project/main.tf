
module "project" {
  source            = "../modules/terraform-google-project"
  billing_account   = var.billing_account
  org_id            = var.org_id
  folder_id         = var.folder_id
  name              = var.name
  project_id        = var.project_id
  random_project_id = var.random_project_id

  #labels                      = var.labels
  enable_apis                 = var.enable_apis
  activate_apis               = var.activate_apis
  disable_services_on_destroy = var.disable_services_on_destroy
  disable_dependent_services  = var.disable_dependent_services
  sa_roles                    = var.sa_roles
  group_emails                = var.group_emails
  member_attributes           = var.member_attributes
}

