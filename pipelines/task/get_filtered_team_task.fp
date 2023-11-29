pipeline "get_filtered_team_task" {
  title       = "Get Filtered Team Tasks"
  description = "View the tasks that meet specific criteria from a Workspace. Responses are limited to 100 tasks per page."

  param "api_token" {
    type        = string
    description = local.api_token_param_description
    default     = var.api_token
  }

  param "team_id" {
    type        = number
    description = "The ID of the team for which to retrieve tasks."
  }

  step "http" "get_filtered_team_task" {
    url = "${local.clickup_api_endpoint}/team/${param.team_id}/task"
    request_headers = {
      Authorization = param.api_token
    }
  }

  output "tasks" {
    description = "The tasks that meet the specified criteria."
    value       = step.http.get_filtered_team_task.response_body.tasks
  }
}