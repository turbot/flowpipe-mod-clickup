pipeline "create_task" {
  title       = "Create Task"
  description = "Create a new task."

  param "api_token" {
    type        = string
    description = local.api_token_param_description
    default     = var.api_token
  }

  param "list_id" {
    type        = number
    description = "The ID of the list where the task will be created."
  }

  param "name" {
    type        = string
    description = "The name of the task to create."
  }

  param "description" {
    type        = string
    description = "The description of the task."
  }

  step "http" "create_task" {
    method = "post"
    url    = "${local.clickup_api_endpoint}/list/${param.list_id}/task"
    request_headers = {
      Content-Type  = "application/json"
      Authorization = param.api_token
    }

    request_body = jsonencode(
      {
        name        = param.name
        description = param.description
      }
    )
  }

  output "task" {
    description = "The created task."
    value       = step.http.create_task.response_body
  }
}