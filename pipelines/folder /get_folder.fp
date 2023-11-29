pipeline "get_folder" {
  title       = "Get Folder"
  description = "View the Lists within a Folder."

  param "api_token" {
    type        = string
    description = local.api_token_param_description
    default     = var.api_token
  }

  param "folder_id" {
    type        = number
    description = "The ID of the folder to retrieve."
  }

  step "http" "get_folder" {
    url = "${local.clickup_api_endpoint}/folder/${param.folder_id}"
    request_headers = {
      Authorization = param.api_token
    }
  }

  output "folder" {
    description = "The retrieved folder."
    value       = step.http.get_folder.response_body
  }
}