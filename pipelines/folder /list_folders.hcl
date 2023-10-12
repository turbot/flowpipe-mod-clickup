// usage: flowpipe pipeline list folders
pipeline "list_folders" {
  description = "List all folders."

  param "token" {
    description = "ClickUp API token."
    type        = string
    default     = var.token
  }

  param "space_id" {
    description = "Space ID."
    type        = number
  }

  step "http" "list_folders" {
    title = "List folders"
    url   = "https://api.clickup.com/api/v2/space/${param.space_id}/folder"
    request_headers = {
      Authorization = param.token
    }
  }

  output "response_body" {
    value = step.http.list_folders.response_body
  }
  output "response_headers" {
    value = step.http.list_folders.response_headers
  }
  output "status_code" {
    value = step.http.list_folders.status_code
  }
}