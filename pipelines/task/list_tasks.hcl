pipeline "list_tasks" {
  title       = "List Tasks in ClickUp"
  description = "This pipeline lists all tasks in a specific ClickUp list using the ClickUp API."

  param "api_token" {
    description = "ClickUp API token for authentication."
    type        = string
    default     = var.api_token
  }

  param "list_id" {
    description = "The ID of the list for which you want to list tasks."
    type        = number
  }

  step "http" "list_tasks" {
    url   = "https://api.clickup.com/api/v2/task/${param.list_id}"
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