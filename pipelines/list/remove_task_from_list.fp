pipeline "remove_task_from_list" {
  title       = "Remove Task From List"
  description = "Remove a task from an additional List."

  param "api_token" {
    type        = string
    description = local.api_token_param_description
    default     = var.api_token
  }

  param "list_id" {
    type        = number
    description = "The ID of the list from where to remove the task."
  }

  param "task_id" {
    type        = string
    description = "The ID of the task to remove from the list."
  }

  step "http" "remove_task_from_list" {
    method = "delete"
    url    = "${local.clickup_api_endpoint}/list/${param.list_id}/task/${param.task_id}"
    request_headers = {
      Authorization = param.api_token
    }
  }
}