/******************************************
  Remote State configuration
 *****************************************/

terraform {
    backend "gcs" {
        bucket = "automl-gcs-bucket"
        prefix = "terraform"
    }
}