pipeline "update_folder" {
  description = "Update a folder by ID."

  param "token" {
    description = "ClickUp API token."
    type        = string
    default     = var.token
  }

  param "folder_id" {
    description = "Folder ID."
    type        = number
  }

  param "name" {
    description = "Folder name."
    type        = string
  }

  step "http" "update_folder" {
    title  = "Update folder"
    method = "put"
    url    = "https://api.clickup.com/api/v2/folder/${param.folder_id}"
    request_headers = {
      Content-Type  = "application/json"
      Authorization = param.token
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