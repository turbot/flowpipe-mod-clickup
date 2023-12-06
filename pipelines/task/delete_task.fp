pipeline "delete_task" {
  title       = "Delete Task"
  description = "Delete a task from your Workspace."

  param "cred" {
    type        = string
    description = local.cred_param_description
    default     = "default"
  }

  param "task_id" {
    type        = string
    description = "The ID of the task to delete."
  }

  step "http" "delete_task" {
    method = "delete"
    url    = "${local.clickup_api_endpoint}/task/${param.task_id}"

    request_headers = {
      Content-Type  = "application/json"
      Authorization = "${credential.clickup[param.cred].token}"
    }
  }
}
