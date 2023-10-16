pipeline "create_list" {
  title       = "Create a List in ClickUp"
  description = "This pipeline creates a list in ClickUp using the ClickUp API."

  param "api_token" {
    description = "ClickUp API token for authentication."
    type        = string
    default     = var.api_token
  }

  param "folder_id" {
    description = "The ID of the folder where you want to create the list."
    type        = number
  }

  param "name" {
    description = "The name of the list you want to create."
    type        = string
  }

  param "assignee" {
    description = "The ID of the assignee for the list (optional)."
    type        = number
  }

  step "http" "create_list" {
    method = "post"
    url    = "https://api.clickup.com/api/v2/folder/${param.folder_id}/list"
    request_headers = {
      Content-Type  = "application/json"
      Authorization = param.api_token
    }

    // We can add more fields here as per requirements
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