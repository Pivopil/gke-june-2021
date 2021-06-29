output "cloud_function_url" {
  value = google_cloudfunctions_function.web_app.https_trigger_url
}
