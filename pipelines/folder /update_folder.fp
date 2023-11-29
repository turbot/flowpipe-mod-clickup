pipeline "update_folder" {
  title       = "Update Folder"
  description = "Rename a Folder."

  param "api_token" {
    type        = string
    description = local.api_token_param_description
    default     = var.api_token
  }

  param "folder_id" {
    type        = number
    description = "The ID of the folder to update."
  }

  param "name" {
    type        = string
    description = "New name for the folder."
  }

  step "http" "update_folder" {
    method = "put"
    url    = "${local.clickup_api_endpoint}/folder/${param.folder_id}"
    request_headers = {
      Content-Type  = "application/json"
      Authorization = param.api_token
    }

    request_body = jsonencode(
      {
        name = param.name
      }
    )
  }

  output "folder" {
    description = "The updated folder."
    value       = step.http.update_folder.response_body
  }
}