pipeline "create_folder" {
  title       = "Create a New Folder in a ClickUp Space"
  description = "This pipeline creates a new folder in a ClickUp space using the ClickUp API."

  param "api_token" {
    description = "ClickUp API token for authentication."
    type        = string
    default     = var.api_token
  }

  param "space_id" {
    description = "The ID of the ClickUp space where you want to create the folder."
    type        = number
  }

  param "name" {
    description = "The name of the folder you want to create."
    type        = string
  }

  step "http" "create_folder" {
    method = "post"
    url    = "https://api.clickup.com/api/v2/space/${param.space_id}/folder"
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
    description = "The folder that was created."
  }
}