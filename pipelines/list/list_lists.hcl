pipeline "list_lists" {
  title       = "List All Lists in a ClickUp Folder"
  description = "This pipeline lists all lists in a ClickUp folder using the ClickUp API."

  param "api_token" {
    description = "ClickUp API token for authentication."
    type        = string
    default     = var.api_token
  }

  param "folder_id" {
    description = "The ID of the folder where you want to list lists."
    type        = number
  }

  step "http" "list_lists" {
    url = "https://api.clickup.com/api/v2/folder/${param.folder_id}/list"
    request_headers = {
      Authorization = param.api_token
    }
  }

  output "lists" {
    value       = step.http.list_lists.response_body.lists
    description = "The lists in the folder."
  }
}