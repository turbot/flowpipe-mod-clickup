pipeline "delete_task" {
  description = "Delete a task by ID."

  param "token" {
    description = "ClickUp API token."
    type        = string
    default     = var.token
  }

  param "task_id" {
    description = "ClickUp task ID."
    type        = string
  }

  step "http" "delete_task" {
    title  = "Delete task"
    url    = "https://api.clickup.com/api/v2/task/${param.task_id}"
    method = "delete"
    request_headers = {
      Content-Type  = "application/json"
      Authorization = param.token
    }
  }

  output "response_body" {
    value = step.http.delete_task.response_body
  }
  output "response_headers" {
    value = step.http.delete_task.response_headers
  }
  output "status_code" {
    value = step.http.delete_task.status_code
  }
}