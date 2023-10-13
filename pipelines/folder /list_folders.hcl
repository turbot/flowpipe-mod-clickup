pipeline "list_folders" {
  title       = "List All Folders in a ClickUp Space"
  description = "This pipeline lists all folders in a ClickUp space using the ClickUp API."

  param "api_token" {
    description = "ClickUp API token for authentication."
    type        = string
    default     = var.api_token
  }

  param "space_id" {
    description = "The ID of the ClickUp space where you want to list folders."
    type        = number
  }

  step "http" "list_folders" {
    url   = "https://api.clickup.com/api/v2/space/${param.space_id}/folder"
    request_headers = {
      Authorization = param.api_token
    }
  }

  output "folders" {
    value       = step.http.list_folders.response_body.folders
    description = "The list of folders."
  }
}