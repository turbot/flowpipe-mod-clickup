pipeline "get_filtered_team_task" {
  title       = "Get Filtered Team Tasks"
  description = "View the tasks that meet specific criteria from a Workspace. Responses are limited to 100 tasks per page."

  param "api_token" {
    description = local.api_token_param_description
    type        = string
    default     = var.api_token
  }

  param "team_id" {
    description = "The ID of the team for which to retrieve tasks."
    type        = number
  }

  step "http" "get_filtered_team_task" {
    url = "${local.clickup_api_endpoint}/team/${param.team_id}/task"
    request_headers = {
      Authorization = param.api_token
    }
  }

  output "tasks" {
    value       = step.http.get_filtered_team_task.response_body.tasks
    description = "The tasks that meet the specified criteria."
  }
}