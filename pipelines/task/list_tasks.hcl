// usage: flowpipe pipeline list tasks
pipeline "list_tasks" {
  description = "List all tasks."

  param "token" {
    description = "ClickUp API token."
    type        = string
    default     = var.token
  }

  param "list_id" {
    description = "ClickUp list ID."
    type        = number
  }

  step "http" "list_tasks" {
    title = "List tasks"
    url   = "https://api.clickup.com/api/v2/task/${param.list_id}"
    request_headers = {
      Authorization = param.token
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