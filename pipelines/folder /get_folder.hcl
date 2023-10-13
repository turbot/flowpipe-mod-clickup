pipeline "get_folder" {
  title       = "Get a Folder by ID"
  description = "This pipeline retrieves a folder in ClickUp by its ID."

  param "api_token" {
    description = "ClickUp API token for authentication."
    type        = string
    default     = var.api_token
  }

  param "folder_id" {
    description = "The ID of the folder you want to retrieve."
    type        = number
  }

  step "http" "get_folder" {
    url = "https://api.clickup.com/api/v2/folder/${param.folder_id}"
    request_headers = {
      Authorization = param.api_token
    }
  }

  output "folder" {
    value       = step.get_folder.response_body
    description = "The folder retrieved from ClickUp."
  }
}