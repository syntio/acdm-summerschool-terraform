variable "working_dir" {
    type = string
    description = "Path of source code"
}

variable "name_of_zip" {
    type = string
    description = "Name of zip file"

}
variable "storagebucket" {
    type = string
    description = "Name of storage bucket"

}
variable "storagebucket_location" {
    type = string
    description = "Location of Bucket"
}
variable "deploy_bucketarchive" {
  description = "If true resource is created"
  type = bool
  default = "false"
}

variable "deploy_cloud_function_pull" {
  description = "If true resource is created"
  type = bool
  default = "false"
}


variable "deploy_topic" {
  description = "If true resource is created"
  type = bool
  default = "false"
}

variable "deploy_source_zip" {
  description = "If true resource is created"
  type = bool
  default = "false"
}

variable "pubsubtopic" {
    type = string
    description = "Name of Topic"
}

variable "cloud_function_name" {
    type = string
    description = "Name of Cloud Function"
}

variable "cloud_function_runtime" {
    type = string
    description = "Runtime of Cloud Function"
}

variable "cloud_function_entry_point" {
    type = string
    description = "Runtime of Cloud Function entry point"
}


variable "cloud_function_memory" {
    type = string
    description = "Memory of Cloud Function"
}

variable "cloud_function_timeout" {
    type = string
    description = "Timeout of Cloud Function"
}
variable "cloud_function_region" {
    type = string
    description = "Region of Cloud Function"
}

variable "event_trigger_retry" {
    type = string
    description = "True or False"
}

variable "msg_prefix" {
    type = string
    description = "MSG prefix"
}
variable "msg_extension" {
    type = string
    description = "MSG Extension"
}

variable "output_path" {
    type = string
    description = "Output path"
}
variable "source_dir" {
    type = string
    description = "Output path"
}

variable "max_outstanding_bytes" {
    type = string
    description = " Max outstanding bytes"
}
variable "synchronous" {
    type = string
    description = "synchronous"
}
variable "bucket_id" {
    type = string
    description = "Bucket_ID"
}
variable "project_id" {
    type = string
    description = "Project_ID"
}
variable "trigger_http" {
    type = bool
    description = "Trigger HTTP"
}