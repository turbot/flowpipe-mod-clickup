pipeline "list_lists" {
  title       = "Get Lists"
  description = "View the lists within a folder."

  param "api_token" {
    description = "The ClickUp API token."
    type        = string
    default     = var.api_token
  }

  param "folder_id" {
    description = "The ID of the folder to get lists."
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
    description = "The lists within the folder."
  }
}