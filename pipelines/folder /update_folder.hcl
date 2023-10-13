pipeline "update_folder" {
  title       = "Update a Folder in ClickUp by ID"
  description = "This pipeline updates a folder in ClickUp by its ID using the ClickUp API."

  param "api_token" {
    description = "ClickUp API token for authentication."
    type        = string
    default     = var.api_token
  }

  param "folder_id" {
    description = "The ID of the folder you want to update."
    type        = number
  }

  param "name" {
    description = "New folder name."
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

  output "folder" {
    value       = step.http.update_folder.response_body
    description = "The updated folder."
  }
}