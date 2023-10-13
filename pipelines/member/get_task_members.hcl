pipeline "get_task_members" {
  title       = "Get Members of a ClickUp Task by ID"
  description = "This pipeline retrieves the members of a ClickUp task by its ID using the ClickUp API."

  param "api_token" {
    description = "ClickUp API api_token for authentication."
    type        = string
    default     = var.api_token
  }

  param "task_id" {
    description = "The ID of the task for which you want to retrieve members."
    type        = string
  }

  step "http" "get_task_members" {
    url = "https://api.clickup.com/api/v2/task/${param.task_id}/member"
    request_headers = {
      Authorization = param.api_token
    }
  }

  output "members" {
    value       = step.http.get_task_members.response_body
    description = "The members of the task."
  }

}