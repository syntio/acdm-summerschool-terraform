  resource "google_cloudfunctions_function" "persistor_push" {
  name        = var.cloud_function_name
  runtime     = var.cloud_function_runtime
  entry_point = var.cloud_function_entry_point
  available_memory_mb = var.cloud_function_memory
  timeout = var.cloud_function_timeout
  source_archive_bucket = var.storagebucket
  source_archive_object = var.name_of_zip
  region = var.cloud_function_region
  
  event_trigger {
  event_type = "providers/cloud.pubsub/eventTypes/topic.publish"
  resource = var.pubsubtopic
  
  failure_policy {
    retry = var.event_trigger_retry
  }
  }
  	environment_variables = {
     MSG_PREFIX = var.msg_prefix
     MSG_EXTENSION = var.msg_extension
     BUCKET_ID = var.storagebucket

  }
  }