resource "google_storage_bucket" "bucket" {
  name = var.storagebucket
  location = var.storagebucket_location
}