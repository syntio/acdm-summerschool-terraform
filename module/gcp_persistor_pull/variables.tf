variable "pubsubtopic" {
    type = string
    description = "Name of Topic"
}

variable "storagebucket" {
    type = string
    description = "Name of Bucket"
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

variable "cloud_function_region" {
    type = string
    description = "Region of Cloud Function"
}

variable "project_id" {
    type = string
    description = "Project ID"

}
variable "trigger_http" {
    type = string
    description = "HTTP trigger"
}

variable "entry_point" {
    type = string
    description = "Entry point"
}

variable "region" {
    type = string
    description = "Region"
}

variable "name_of_zip" {
    type = string
    description = "Name of ZIP"
}
