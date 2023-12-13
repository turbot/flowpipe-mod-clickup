pipeline "list_tasks" {
  title       = "List Tasks"
  description = "View the tasks in a List."

  param "cred" {
    type        = string
    description = local.cred_param_description
    default     = "default"
  }

  param "list_id" {
    type        = number
    description = "The ID of the list for which to list tasks."
  }

  step "http" "list_tasks" {
    method = "get"
    url    = "${local.clickup_api_endpoint}/list/${param.list_id}/task?page=0"

    request_headers = {
      Authorization = "${credential.clickup[param.cred].token}"
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
