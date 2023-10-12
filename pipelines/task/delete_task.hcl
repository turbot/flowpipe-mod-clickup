pipeline "delete_task" {
  title       = "Delete a Task in ClickUp by ID"
  description = "This pipeline deletes a task in ClickUp by its ID using the ClickUp API."

  param "api_token" {
    description = "ClickUp API token for authentication."
    type        = string
    default     = var.api_token
  }

  param "task_id" {
    description = "The ID of the task you want to delete."
    type        = string
  }

  step "http" "delete_task" {
    title  = "Delete Task Request"
    url    = "https://api.clickup.com/api/v2/task/${param.task_id}"
    method = "delete"
    request_headers = {
      Content-Type  = "application/json"
      Authorization = param.api_token
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