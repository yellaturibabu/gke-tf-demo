provider "google" {
  credentials = "${file("./creds/serviceaccount.json")}"
  project     = "terraform-kube"
  region      = "europe-west1"
}
