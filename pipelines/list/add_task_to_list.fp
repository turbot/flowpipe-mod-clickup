pipeline "add_task_to_list" {
  title       = "Add Task To List"
  description = "Add a task to an additional List."

  param "api_token" {
    type        = string
    description = local.api_token_param_description
    default     = var.api_token
  }

  param "list_id" {
    type        = number
    description = "The ID of the list to add the task to."
  }

  param "task_id" {
    type        = string
    description = "The ID of the task to add to the list."
  }

  step "http" "add_task_to_list" {
    method = "post"
    url    = "${local.clickup_api_endpoint}/list/${param.list_id}/task/${param.task_id}"
    request_headers = {
      Authorization = param.api_token
    }
  }
}