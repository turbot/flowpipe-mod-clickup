pipeline "create_list" {
  description = "Create a list."

  param "token" {
    type    = string
    default = var.token
  }

  param "folder_id" {
    type = number
  }

  param "name" {
    type = string
  }

  param "assignee" {
    type = number
  }

  step "http" "create_list" {
    method = "post"
    url    = "https://api.clickup.com/api/v2/folder/${param.folder_id}/list"
    request_headers = {
      Content-Type  = "application/json"
      Authorization = param.token
    }

    // We can add for more fields here as per requirement
    request_body = jsonencode(
      {
        name     = param.name
        assignee = param.assignee
      }
    )

  }

  output "response_body" {
    value = step.http.create_list.response_body
  }
  output "response_headers" {
    value = step.http.create_list.response_headers
  }
  output "status_code" {
    value = step.http.create_list.status_code
  }
}