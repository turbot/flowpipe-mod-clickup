pipeline "get_filtered_team_task" {
  description = "Get a task by ID."

  param "token" {
    description = "ClickUp API token."
    type        = string
    default     = var.token
  }

  param "team_id" {
    description = "ClickUp team ID."
    type        = number
  }

  step "http" "get_filtered_team_task" {
    title = "Get a task by ID"
    url   = "https://api.clickup.com/api/v2/team/${param.team_id}/task"
    request_headers = {
      Authorization = param.token
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