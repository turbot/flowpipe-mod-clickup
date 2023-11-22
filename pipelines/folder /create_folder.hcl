pipeline "create_folder" {
  title       = "Create a New Folder"
  description = "Add a new folder to a space."

  param "api_token" {
    description = "The ClickUp API token."
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

  output "response_body" {
    value = step.http.create_folder.response_body
  }
  output "response_headers" {
    value = step.http.create_folder.response_headers
  }
  output "status_code" {
    value = step.http.create_folder.status_code
  }
}