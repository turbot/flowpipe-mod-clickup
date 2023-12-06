pipeline "get_task" {
  title       = "Get Task"
  description = "View information about a task."

  param "cred" {
    type        = string
    description = local.cred_param_description
    default     = "default"
  }

  param "task_id" {
    type        = string
    description = "The ID of the task to retrieve."
  }

  step "http" "get_task" {
    method = "get"
    url    = "${local.clickup_api_endpoint}/task/${param.task_id}"

    request_headers = {
      Authorization = "${credential.clickup[param.cred].token}"
    }
  }

  output "task" {
    description = "The retrieved task."
    value       = step.http.get_task.response_body
  }
}
