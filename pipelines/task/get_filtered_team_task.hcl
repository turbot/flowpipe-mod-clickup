pipeline "get_filtered_team_task" {
  title       = "Get Filtered Team Tasks"
  description = "View the tasks that meet specific criteria from a workspace. Responses are limited to 100 tasks per page."

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

  output "response_body" {
    value = step.http.get_filtered_team_task.response_body
  }
  output "response_headers" {
    value = step.http.get_filtered_team_task.response_headers
  }
  output "status_code" {
    value = step.http.get_filtered_team_task.status_code
  }
}