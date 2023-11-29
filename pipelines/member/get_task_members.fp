pipeline "get_task_members" {
  title       = "Get Task Members"
  description = "View the people who have access to a Task."

  param "api_token" {
    description = local.api_token_param_description
    type        = string
    default     = var.api_token
  }

  param "task_id" {
    description = "The ID of the task to retrieve members."
    type        = number
  }

  step "http" "get_task_members" {
    url = "${local.clickup_api_endpoint}/task/${param.task_id}/member"
    request_headers = {
      Authorization = param.token
    }
  }

  output "members" {
    value       = step.http.get_task_members.response_body.members
    description = "The members of the task."
  }
}