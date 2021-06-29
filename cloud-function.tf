resource "google_storage_bucket" "bucket" {
  project = google_project.project.project_id
  name = "${var.prefix}-cloudfunction-${random_string.suffix.result}"
  location = var.function_location
}

data "archive_file" "http_trigger" {
  type        = "zip"
  output_path = "${path.module}/files/http_trigger.zip"
  source {
    content  = file("${path.module}/files/http_trigger.js")
    filename = "index.js"
  }
}

resource "google_storage_bucket_object" "archive" {
  name       = "http_trigger.zip"
  bucket     = google_storage_bucket.bucket.name
  source     = "${path.module}/files/http_trigger.zip"
  depends_on = [data.archive_file.http_trigger]
}

resource "google_cloudfunctions_function" "web_app" {
  name        = "webhookFunction"
  runtime     = "nodejs10"
  entry_point = "webhook"
  project     = google_project.project.project_id
  //https://cloud.google.com/functions/docs/locations
  region      = var.function_location

  available_memory_mb   = 128
  timeout               = 60
  trigger_http          = true
  source_archive_bucket = google_storage_bucket.bucket.name
  source_archive_object = google_storage_bucket_object.archive.name
}

resource "google_cloudfunctions_function_iam_member" "invoker" {
  project        = google_cloudfunctions_function.web_app.project
  region         = google_cloudfunctions_function.web_app.region
  cloud_function = google_cloudfunctions_function.web_app.name

  role   = "roles/cloudfunctions.invoker"
  member = "allUsers"
}
