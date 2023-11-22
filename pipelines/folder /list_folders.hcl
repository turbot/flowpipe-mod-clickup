pipeline "list_folders" {
  title       = "List all Folders"
  description = "View the folders in a space."

  param "api_token" {
    description = "The ClickUp API token."
    type        = string
    default     = var.api_token
  }

  param "space_id" {
    description = "The ID of the space to list folders."
    type        = number
  }

  step "http" "list_folders" {
    url = "https://api.clickup.com/api/v2/space/${param.space_id}/folder"
    request_headers = {
      Authorization = param.api_token
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