pipeline "update_task" {
  title       = "Update Task"
  description = "Update a task."

  param "api_token" {
    description = local.api_token_param_description
    type        = string
    default     = var.api_token
  }

  param "task_id" {
    description = "The ID of the task to update."
    type        = string
  }

  param "name" {
    description = "New name for the task."
    type        = string
  }

  param "status" {
    description = "New task status."
    type        = string
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
    value       = step.http.update_task.response_body
    description = "The updated task."
  }
}
