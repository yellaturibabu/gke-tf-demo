provider "google" {
  credentials = "${file("./creds/serviceaccount.json")}"
  project     = "${var.projectname}"
  region      = "europe-west1"
}
