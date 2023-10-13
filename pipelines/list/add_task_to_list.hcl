pipeline "add_task_to_list" {
  title       = "Add a Task to a ClickUp List"
  description = "This pipeline adds a task to a ClickUp list using the ClickUp API."

  param "api_token" {
    description = "ClickUp API token for authentication."
    type        = string
    default     = var.api_token
  }

  param "list_id" {
    description = "The ID of the ClickUp list where you want to add the task."
    type        = number
  }

  param "task_id" {
    description = "The ID of the ClickUp task you want to add to the list."
    type        = string
  }

  step "http" "add_task_to_list" {
    method = "post"
    url    = "https://api.clickup.com/api/v2/list/${param.list_id}/task/${param.task_id}"
    request_headers = {
      Authorization = param.api_token
    }
  }
}