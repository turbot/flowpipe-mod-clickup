pipeline "update_task" {
  title       = "Update a Task"
  description = "Update a task."

  param "api_token" {
    description = "The ClickUp API token."
    type        = string
    default     = var.api_token
  }

  param "task_id" {
    description = "The ID of the task to update."
    type        = string
  }

  param "name" {
    description = "New name for the task."
    optional    = true
    type        = string
  }

  param "status" {
    description = "New task status."
    optional    = true
    type        = string
  }

  step "http" "update_task" {
    method = "put"
    url    = "https://api.clickup.com/api/v2/task/${param.task_id}"
    request_headers = {
      Content-Type  = "application/json"
      Authorization = param.api_token
    }

    request_body = jsonencode(
      {
        name   = param.name
        status = param.status
      }
    )
  }

  output "response_body" {
    value = step.http.update_task.response_body
  }
  output "response_headers" {
    value = step.http.update_task.response_headers
  }
  output "status_code" {
    value = step.http.update_task.status_code
  }
}
