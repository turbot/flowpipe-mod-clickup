pipeline "list_tasks" {
  title       = "List Tasks"
  description = "View the tasks in a List."

  param "api_token" {
    type        = string
    description = local.api_token_param_description
    default     = var.api_token
  }

  param "list_id" {
    type        = number
    description = "The ID of the list for which to list tasks."
  }

  step "http" "list_tasks" {
    url = "${local.clickup_api_endpoint}/task/${param.list_id}"
    request_headers = {
      Authorization = param.api_token
    }
  }

  output "tasks" {
    description = "The tasks in the list."
    value       = step.http.list_tasks.response_body.tasks
  }
}