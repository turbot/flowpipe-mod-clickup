pipeline "delete_task" {
  description = "Delete a task by ID."

  param "token" {
    type    = string
    default = var.token
  }

  param "task_id" {
    type = string
  }

  step "http" "delete_task" {
    url    = "https://api.clickup.com/api/v2/task/${param.task_id}"
    method = "delete"
    request_headers = {
      Content-Type  = "application/json"
      Authorization = param.token
    }
  }

  output "response_body" {
    description = "Response body."
    value       = step.http.delete_task.response_body
  }
  output "response_headers" {
    value = step.http.delete_task.response_headers
  }
  output "status_code" {
    value = step.http.delete_task.status_code
  }
}