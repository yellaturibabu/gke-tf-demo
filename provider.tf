provider "google" {
  credentials = "${file("./creds/serviceaccount.json")}"
  project     = "${projectname}"
  region      = "europe-west1"
}
