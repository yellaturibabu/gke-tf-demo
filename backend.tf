terraform {
  backend "gcs" {
    bucket      = "gke-tf-myh-test-tfstate"
    credentials = "./creds/serviceaccount.json"
  }
}
