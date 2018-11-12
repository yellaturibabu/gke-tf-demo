terraform {
  backend "gcs" {
    bucket      = "gke-tf-my-test-tfstate"
    credentials = "./creds/serviceaccount.json"
  }
}
