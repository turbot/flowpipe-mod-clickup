pipeline "create_task" {
  description = "Create a task."

  param "token" {
    type    = string
    default = var.token
  }

  param "list_id" {
    type = number
  }

  param "name" {
    type = string
  }

  param "description" {
    type = string
  }

  step "http" "create_task" {
    method = "post"
    url    = "https://api.clickup.com/api/v2/list/${param.list_id}/task"
    request_headers = {
      Content-Type  = "application/json"
      Authorization = param.token
    }

    request_body = jsonencode(
      {
        name        = param.name
        description = param.description
      }
    )

  }

  output "response_body" {
    value = step.http.create_task.response_body
  }
  output "response_headers" {
    value = step.http.create_task.response_headers
  }
  output "status_code" {
    value = step.http.create_task.status_code
  }
}