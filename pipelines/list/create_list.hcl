pipeline "create_list" {
  description = "Create a list."

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
    description = "Name of the list."
    type        = string
  }

  param "assignee" {
    description = "Assignee ID."
    type        = number
  }

  step "http" "create_list" {
    title  = "Create a list"
    method = "post"
    url    = "https://api.clickup.com/api/v2/folder/${param.folder_id}/list"
    request_headers = {
      Content-Type  = "application/json"
      Authorization = param.token
    }

    // We can add for more fields here as per requirement
    request_body = jsonencode(
      {
        name     = param.name
        assignee = param.assignee
      }
    )

  }

  output "response_body" {
    value = step.http.create_list.response_body
  }
  output "response_headers" {
    value = step.http.create_list.response_headers
  }
  output "status_code" {
    value = step.http.create_list.status_code
  }
}