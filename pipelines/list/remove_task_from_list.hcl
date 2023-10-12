pipeline "remove_task_from_list" {
  description = "Remove task from list."

  param "token" {
    description = "ClickUp API token."
    type        = string
    default     = var.token
  }

  param "list_id" {
    description = "ClickUp list ID."
    type        = number
  }

  param "task_id" {
    description = "ClickUp task ID."
    type        = string
  }

  step "http" "remove_task_from_list" {
    title  = "Remove task from list"
    method = "delete"
    url    = "https://api.clickup.com/api/v2/list/${param.list_id}/task/${param.task_id}"
    request_headers = {
      Authorization = param.token
    }
  }

  output "response_body" {
    value = step.http.remove_task_from_list.response_body
  }
  output "response_headers" {
    value = step.http.remove_task_from_list.response_headers
  }
  output "status_code" {
    value = step.http.remove_task_from_list.status_code
  }
}