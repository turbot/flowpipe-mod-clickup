pipeline "list_folder_lists" {
  title       = "Get Lists"
  description = "View the Lists within a Folder."

  param "api_token" {
    description = local.api_token_param_description
    type        = string
    default     = var.api_token
  }

  param "folder_id" {
    description = "The ID of the folder to get lists."
    type        = number
  }

  step "http" "list_folder_lists" {
    url = "https://api.clickup.com/api/v2/folder/${param.folder_id}/list"
    request_headers = {
      Authorization = param.api_token
    }
  }

  output "lists" {
    value       = step.http.list_folder_lists.response_body.lists
    description = "The lists within the folder."
  }
}