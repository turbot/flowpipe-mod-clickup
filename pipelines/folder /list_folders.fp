pipeline "list_folders" {
  title       = "List Folders"
  description = "View the Folders in a Space."

  param "api_token" {
    description = local.api_token_param_description
    type        = string
    default     = var.api_token
  }

  param "space_id" {
    description = "The ID of the space to list folders."
    type        = number
  }

  step "http" "list_folders" {
    url = "${local.clickup_api_endpoint}/space/${param.space_id}/folder"
    request_headers = {
      Authorization = param.api_token
    }
  }

  output "folders" {
    value       = step.http.list_folders.response_body.folders
    description = "The folders in the space."
  }
}