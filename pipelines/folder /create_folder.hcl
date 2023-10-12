pipeline "create_folder" {
  description = "Create a folder."

  param "token" {
    description = "ClickUp API token."
    type        = string
    default     = var.token
  }

  param "space_id" {
    description = "Space ID."
    type        = number
  }

  param "name" {
    description = "Folder name."
    type        = string
  }

  step "http" "create_folder" {
    title  = "Create folder"
    method = "post"
    url    = "https://api.clickup.com/api/v2/space/${param.space_id}/folder"
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
    value = step.http.create_folder.response_body
  }
  output "response_headers" {
    value = step.http.create_folder.response_headers
  }
  output "status_code" {
    value = step.http.create_folder.status_code
  }
}