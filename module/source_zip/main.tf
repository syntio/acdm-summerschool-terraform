data "archive_file" "pull" {
  type        = "zip"
  source_dir = var.working_dir
  output_path = var.name_of_zip
  excludes    = [".gcloudignore"]
}

resource "google_storage_bucket_object" "archive" {
  name   = var.name_of_zip
  bucket = var.storagebucket
  source = var.name_of_zip
  depends_on = [data.archive_file.pull]
}
