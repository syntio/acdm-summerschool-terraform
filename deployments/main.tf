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
module "source_zip" {
  source = "../module/source_zip"
  count = var.deploy_source_zip ? 1 : 0
  working_dir = var.working_dir
  source_dir = var.source_dir
  output_path = var.output_path
  name_of_zip = var.name_of_zip
  storagebucket = var.storagebucket
  depends_on = [module.bucket_archive]
}

module "cloud_function_pull" {
  source = "../module/gcp_persistor_pull"
  count = var.deploy_cloud_function_pull ? 1 : 0
  cloud_function_name = var.cloud_function_name
  cloud_function_runtime  = var.cloud_function_runtime
  cloud_function_entry_point = var.cloud_function_entry_point
  cloud_function_memory = var.cloud_function_memory
  storagebucket = var.storagebucket
  cloud_function_region = var.cloud_function_region
  pubsubtopic = var.pubsubtopic
  project_id = var.project_id
  name_of_zip = var.name_of_zip
  trigger_http = var.trigger_http
  entry_point = var.cloud_function_entry_point
  region = var.cloud_function_region
  depends_on = [module.bucket_archive]
}