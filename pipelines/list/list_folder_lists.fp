pipeline "list_folder_lists" {
  title       = "Get Lists"
  description = "View the Lists within a Folder."

  param "api_token" {
    type        = string
    description = local.api_token_param_description
    default     = var.api_token
  }

  param "folder_id" {
    type        = number
    description = "The ID of the folder to get lists."
  }

  step "http" "list_folder_lists" {
    url = "${local.clickup_api_endpoint}/folder/${param.folder_id}/list"
    request_headers = {
      Authorization = param.api_token
    }
  }

  output "lists" {
    description = "The lists within the folder."
    value       = step.http.list_folder_lists.response_body.lists
  }
}