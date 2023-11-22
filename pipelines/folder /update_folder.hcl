pipeline "update_folder" {
  title       = "Update a Folder"
  description = "Rename a folder."

  param "api_token" {
    description = "The ClickUp API token."
    type        = string
    default     = var.api_token
  }

  param "folder_id" {
    description = "The ID of the folder to update."
    type        = number
  }

  param "name" {
    description = "New name for the folder."
    type        = string
  }

  step "http" "update_folder" {
    method = "put"
    url    = "https://api.clickup.com/api/v2/folder/${param.folder_id}"
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
    value = step.http.update_folder.response_body
  }
  output "response_headers" {
    value = step.http.update_folder.response_headers
  }
  output "status_code" {
    value = step.http.update_folder.status_code
  }
}