pipeline "add_task_to_list" {
  title       = "Add Task To List"
  description = "Add a task to an additional List."

  param "api_token" {
    description = local.api_token_param_description
    type        = string
    default     = var.api_token
  }

  param "list_id" {
    description = "The ID of the list to add the task to."
    type        = number
  }

  param "task_id" {
    description = "The ID of the task to add to the list."
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