provider "google" {
  credentials = "${file("./creds/serviceaccount.json")}"
  project     = "test-qa-212205"
  region      = "europe-west1"
}
