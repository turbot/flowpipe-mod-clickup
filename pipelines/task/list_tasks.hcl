pipeline "list_tasks" {
  title       = "List all Tasks"
  description = "View the tasks in a list."

  param "api_token" {
    description = "The ClickUp API token."
    type        = string
    default     = var.api_token
  }

  param "list_id" {
    description = "The ID of the list for which to list tasks."
    type        = number
  }

  step "http" "list_tasks" {
    url = "https://api.clickup.com/api/v2/task/${param.list_id}"
    request_headers = {
      Authorization = param.api_token
    }
  }

  output "response_body" {
    value = step.http.list_tasks.response_body
  }
  output "response_headers" {
    value = step.http.list_tasks.response_headers
  }
  output "status_code" {
    value = step.http.list_tasks.status_code
  }
}