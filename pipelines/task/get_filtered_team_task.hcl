pipeline "get_filtered_team_task" {
  title       = "Get Team Tasks in ClickUp"
  description = "This pipeline retrieves filtered team tasks in ClickUp using the ClickUp API."

  param "api_token" {
    description = "ClickUp API token for authentication."
    type        = string
    default     = var.api_token
  }

  param "team_id" {
    description = "The ID of the team for which you want to retrieve tasks."
    type        = number
  }

  step "http" "get_filtered_team_task" {
    url   = "https://api.clickup.com/api/v2/team/${param.team_id}/task"
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