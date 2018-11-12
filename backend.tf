terraform {
  backend "gcs" {
    bucket      = "gke-tf-my-tfstate"
    credentials = "./creds/serviceaccount.json"
  }
}
