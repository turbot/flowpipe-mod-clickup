pipeline "remove_task_from_list" {
  title       = "Remove Task from List"
  description = "Remove a task from an additional List."

  param "cred" {
    type        = string
    description = local.cred_param_description
    default     = "default"
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
      Authorization = "${credential.clickup[param.cred].token}"
    }
  }
}
