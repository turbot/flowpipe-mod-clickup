pipeline "create_folder" {
  title       = "Create New Folder"
  description = "Add a new Folder to a Space."

  param "api_token" {
    description = local.api_token_param_description
    type        = string
    default     = var.api_token
  }

  param "space_id" {
    description = "The ID of the space where the new folder will be created."
    type        = number
  }

  param "name" {
    description = "The name of the folder to create."
    type        = string
  }

  step "http" "create_folder" {
    method = "post"
    url    = "${local.clickup_api_endpoint}/space/${param.space_id}/folder"
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
    value       = step.http.create_folder.response_body
    description = "The newly created folder."
  }
}