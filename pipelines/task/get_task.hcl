pipeline "get_task" {
  description = "Get a task by ID."

  param "token" {
    description = "ClickUp API token."
    type        = string
    default     = var.token
  }

  param "task_id" {
    description = "ClickUp task ID."
    type        = string
  }

  step "http" "get_task" {
    title = "Get task"
    url   = "https://api.clickup.com/api/v2/task/${param.task_id}"
    request_headers = {
      Authorization = param.token
    }
  }

  output "response_body" {
    value = step.http.get_task.response_body
  }
  output "response_headers" {
    value = step.http.get_task.response_headers
  }
  output "status_code" {
    value = step.http.get_task.status_code
  }
}