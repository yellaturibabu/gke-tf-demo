terraform {
  backend "gcs" {
    bucket      = "gke-tf-myh-tfstate"
    credentials = "./creds/serviceaccount.json"
  }
}
