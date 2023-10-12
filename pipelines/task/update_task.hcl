pipeline "update_task" {
  description = "Update a task by ID."

  param "token" {
    description = "ClickUp API token."
    type        = string
    default     = var.token
  }

  param "task_id" {
    description = "ClickUp task ID."
    type        = string
  }

  param "name" {
    description = "Task name."
    type        = string
  }

  param "status" {
    description = "Task status."
    type        = string
  }

  step "http" "update_task" {
    title  = "Update task"
    method = "put"
    url    = "https://api.clickup.com/api/v2/task/${param.task_id}"
    request_headers = {
      Content-Type  = "application/json"
      Authorization = param.token
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