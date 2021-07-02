provider google {
  project = "landscape-project-220208"
  region = "europe-west1"
}

  terraform {
  backend "gcs" {
    bucket = "backend-summer"
  }
  }

module "source" {
  source = "../module/source_code"
}


module "topic" {
  source = "../module/gcs_pubsub_topic"
  count = var.deploy_topic ? 1 : 0
  pubsubtopic = var.pubsubtopic
}

module "bucket_archive" {
  source = "../module/gcs_storage_bucket"
  count = var.deploy_bucketarchive ? 1 : 0
  storagebucket = var.storagebucket
  storagebucket_location = var.storagebucket_location
}

module "cloud_function_push" {
  source = "../module/gcp_persistor_push"
  count = var.deploy_cloud_function_push ? 1 : 0
  cloud_function_name = var.cloud_function_name
  cloud_function_runtime  = var.cloud_function_runtime
  cloud_function_entry_point = var.cloud_function_entry_point
  cloud_function_memory = var.cloud_function_memory
  cloud_function_timeout = var.cloud_function_timeout
  name_of_zip = var.name_of_zip
  storagebucket = var.storagebucket
  cloud_function_region = var.cloud_function_region
  pubsubtopic = var.pubsubtopic
  event_trigger_retry = var.event_trigger_retry
  msg_extension = var.msg_extension
  msg_prefix = var.msg_prefix
  bucket_id = var.storagebucket

  depends_on = [module.bucket_archive]
}


