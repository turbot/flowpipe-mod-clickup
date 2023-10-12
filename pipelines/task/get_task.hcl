pipeline "get_task" {
  title       = "Get a Task in ClickUp by ID"
  description = "This pipeline retrieves a task in ClickUp by its ID using the ClickUp API."

  param "api_token" {
    description = "ClickUp API token for authentication."
    type        = string
    default     = var.api_token
  }

  param "task_id" {
    description = "The ID of the task you want to retrieve."
    type        = string
  }

  step "http" "get_task" {
    url   = "https://api.clickup.com/api/v2/task/${param.task_id}"
    request_headers = {
      Authorization = param.api_token
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