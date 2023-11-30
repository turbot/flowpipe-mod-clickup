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
    url = "${local.clickup_api_endpoint}/list/${param.list_id}/task?page=0"
    request_headers = {
      Authorization = param.api_token
    }

    loop {
      until = result.response_body.last_page == true
      url   = "${local.clickup_api_endpoint}/list/${param.list_id}/task?page=${loop.index + 1}"
    }
  }

  output "tasks" {
    description = "The tasks in the list."
    value       = flatten([for page, tasks in step.http.list_tasks : tasks.response_body.tasks])
  }
}
