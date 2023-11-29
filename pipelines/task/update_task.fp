pipeline "update_task" {
  title       = "Update Task"
  description = "Update a task."

  param "api_token" {
    type        = string
    description = local.api_token_param_description
    default     = var.api_token
  }

  param "task_id" {
    type        = string
    description = "The ID of the task to update."
  }

  param "name" {
    type        = string
    description = "New name for the task."
  }

  param "status" {
    type        = string
    description = "New task status."
  }

  step "http" "update_task" {
    method = "put"
    url    = "${local.clickup_api_endpoint}/task/${param.task_id}"
    request_headers = {
      Content-Type  = "application/json"
      Authorization = param.api_token
    }

    request_body = jsonencode(
      {
        name   = param.name
        status = param.status
      }
    )
  }

  output "task" {
    description = "The updated task."
    value       = step.http.update_task.response_body
  }
}
