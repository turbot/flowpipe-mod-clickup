pipeline "create_task" {
  title       = "Create a Task in ClickUp"
  description = "This pipeline creates a task in ClickUp using the ClickUp API."

  param "api_token" {
    description = "ClickUp API token for authentication."
    type        = string
    default     = var.api_token
  }

  param "list_id" {
    description = "The ID of the list where you want to create the task."
    type        = number
  }

  param "name" {
    description = "The name of the task you want to create."
    type        = string
  }

  param "description" {
    description = "The description of the task."
    type        = string
  }

  step "http" "create_task" {
    method = "post"
    url    = "https://api.clickup.com/api/v2/list/${param.list_id}/task"
    request_headers = {
      Content-Type  = "application/json"
      Authorization = param.api_token
    }

    request_body = jsonencode(
      {
        name        = param.name
        description = param.description
      }
    )
  }

  output "response_body" {
    value = step.http.create_task.response_body
  }
  output "response_headers" {
    value = step.http.create_task.response_headers
  }
  output "status_code" {
    value = step.http.create_task.status_code
  }
}