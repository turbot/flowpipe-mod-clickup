pipeline "get_task_members" {
  title       = "Get Task Members"
  description = "View the people who have access to a Task."

  param "cred" {
    type        = string
    description = local.cred_param_description
    default     = "default"
  }

  param "task_id" {
    type        = string
    description = "The ID of the task to retrieve members."
  }

  step "http" "get_task_members" {
    method = "get"
    url    = "${local.clickup_api_endpoint}/task/${param.task_id}/member"

    request_headers = {
      Authorization = "${credential.clickup[param.cred].token}"
    }
  }

  output "members" {
    description = "The members of the task."
    value       = step.http.get_task_members.response_body.members
  }
}
