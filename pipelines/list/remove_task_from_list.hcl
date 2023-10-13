pipeline "remove_task_from_list" {
  title       = "Remove a Task from a ClickUp List"
  description = "This pipeline removes a task from a ClickUp list using the ClickUp API."

  param "api_token" {
    description = "ClickUp API token for authentication."
    type        = string
    default     = var.api_token
  }

  param "list_id" {
    description = "The ID of the ClickUp list from which you want to remove the task."
    type        = number
  }

  param "task_id" {
    description = "The ID of the ClickUp task you want to remove from the list."
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