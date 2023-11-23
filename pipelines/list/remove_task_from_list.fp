pipeline "remove_task_from_list" {
  title       = "Remove Task From List"
  description = "Remove a task from an additional List."

  param "api_token" {
    description = "The ClickUp API token."
    type        = string
    default     = var.api_token
  }

  param "list_id" {
    description = "The ID of the list from where to remove the task."
    type        = number
  }

  param "task_id" {
    description = "The ID of the task to remove from the list."
    type        = string
  }

  step "http" "remove_task_from_list" {
    method = "delete"
    url    = "https://api.clickup.com/api/v2/list/${param.list_id}/task/${param.task_id}"
    request_headers = {
      Authorization = param.api_token
    }
  }
}