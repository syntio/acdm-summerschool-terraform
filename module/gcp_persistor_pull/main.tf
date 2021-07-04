resource "google_cloudfunctions_function" "function" {
  name        = var.cloud_function_name
  runtime     = var.cloud_function_runtime
  available_memory_mb   = var.cloud_function_memory
  source_archive_bucket = var.storagebucket
  source_archive_object = var.name_of_zip
  region                = var.cloud_function_region


  event_trigger {
  event_type = "providers/cloud.pubsub/eventTypes/topic.publish"
  resource = var.pubsubtopic
  }
}