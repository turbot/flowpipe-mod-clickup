pipeline "get_filtered_team_task" {
  title       = "Get Filtered Team Tasks"
  description = "View the tasks that meet specific criteria from a Workspace. Responses are limited to 100 tasks per page."

  param "api_token" {
    description = "The ClickUp API token."
    type        = string
    default     = var.api_token
  }

  param "team_id" {
    description = "The ID of the team for which to retrieve tasks."
    type        = number
  }

  step "http" "get_filtered_team_task" {
    url = "https://api.clickup.com/api/v2/team/${param.team_id}/task"
    request_headers = {
      Authorization = param.api_token
    }
  }

  output "tasks" {
    value       = step.http.get_filtered_team_task.response_body.tasks
    description = "The tasks that meet the specified criteria."
  }
}