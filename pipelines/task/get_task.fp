pipeline "get_task" {
  title       = "Get Task"
  description = "View information about a task."

  param "api_token" {
    type        = string
    description = local.api_token_param_description
    default     = var.api_token
  }

  param "task_id" {
    type        = string
    description = "The ID of the task to retrieve."
  }

  step "http" "get_task" {
    url = "${local.clickup_api_endpoint}/task/${param.task_id}"
    request_headers = {
      Authorization = param.api_token
    }
  }

  output "task" {
    description = "The retrieved task."
    value       = step.http.get_task.response_body
  }
}