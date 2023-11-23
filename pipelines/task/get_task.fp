pipeline "get_task" {
  title       = "Get Task"
  description = "View information about a task."

  param "api_token" {
    description = "The ClickUp API token."
    type        = string
    default     = var.api_token
  }

  param "task_id" {
    description = "The ID of the task to retrieve."
    type        = string
  }

  step "http" "get_task" {
    url = "https://api.clickup.com/api/v2/task/${param.task_id}"
    request_headers = {
      Authorization = param.api_token
    }
  }

  output "task" {
    value       = step.http.get_task.response_body
    description = "The retrieved task."
  }
}