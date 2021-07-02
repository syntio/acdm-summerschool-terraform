data "terraform_remote_state" "project_id" {
  backend   = "gcs"

  config = {
    bucket = "backend-summer-school-test"
    prefix = "terraform/state"
    credentials = file("credentials.json")
}
}
