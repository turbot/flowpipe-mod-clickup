pipeline "delete_task" {
  title       = "Delete Task"
  description = "Delete a task from your Workspace."

  param "api_token" {
    description = local.api_token_param_description
    type        = string
    default     = var.api_token
  }

  param "task_id" {
    description = "The ID of the task to delete."
    type        = string
  }

  step "http" "delete_task" {
    url    = "${local.clickup_api_endpoint}/task/${param.task_id}"
    method = "delete"
    request_headers = {
      Content-Type  = "application/json"
      Authorization = param.api_token
    }
  }
}