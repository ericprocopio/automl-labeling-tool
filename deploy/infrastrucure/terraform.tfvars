#Example tfvars
credentials_path = "../terraform.json"

billing_account = ""
org_id          = ""
folder_id       = ""

name              = "auto-ml-project"
project_id        = "auto-ml-project"
random_project_id = true # disable to get exact project ID

labels = {
  auto-ml-key : "auto-ml-values",
}

enable_apis = "true"
activate_apis = [
  "compute.googleapis.com",
  "cloudbuild.googleapis.com",
  "cloudresourcemanager.googleapis.com",
  "containerregistry.googleapis.com",
  "iam.googleapis.com",
  "servicemanagement.googleapis.com",
  "dns.googleapis.com",

]

disable_services_on_destroy = "true"
disable_dependent_services  = "true"

member_attributes = {
  
  "user:eprocopio@kubernetes.deloitte.com" = {
    roles = [
      "roles/owner",
    ]
  }
}
