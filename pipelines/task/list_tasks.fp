pipeline "list_tasks" {
  title       = "List Tasks"
  description = "View the tasks in a List."

  param "api_token" {
    description = local.api_token_param_description
    type        = string
    default     = var.api_token
  }

  param "list_id" {
    description = "The ID of the list for which to list tasks."
    type        = number
  }

  step "http" "list_tasks" {
    url = "${local.clickup_api_endpoint}/task/${param.list_id}"
    request_headers = {
      Authorization = param.api_token
    }
  }

  output "tasks" {
    value       = step.http.list_tasks.response_body.tasks
    description = "The tasks in the list."
  }
}