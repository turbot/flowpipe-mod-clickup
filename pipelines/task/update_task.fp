pipeline "update_task" {
  title       = "Update Task"
  description = "Update a task."

  tags = {
    recommended = "true"
  }

  param "conn" {
    type        = connection.clickup
    description = local.conn_param_description
    default     = connection.clickup.default
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
      Authorization = "${param.conn.token}"
    }

    request_body = jsonencode({
      for name, value in param : name => value if value != null
    })
  }

  output "task" {
    description = "The updated task."
    value       = step.http.update_task.response_body
  }
}
