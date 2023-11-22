pipeline "create_task" {
  title       = "Create Task"
  description = "Create a new task."

  param "api_token" {
    description = "The ClickUp API token."
    type        = string
    default     = var.api_token
  }

  param "list_id" {
    description = "The ID of the list where the task will be created."
    type        = number
  }

  param "name" {
    description = "The name of the task to create."
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