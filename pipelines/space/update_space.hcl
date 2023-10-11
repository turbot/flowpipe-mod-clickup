pipeline "update_space" {
  description = "Update a space by ID."

  param "token" {
    type    = string
    default = var.token
  }

  param "space_id" {
    type = number
  }

  param "name" {
    type = string
  }

  param "private" {
    type = bool
  }

  step "http" "update_space" {
    method = "put"
    url    = "https://api.clickup.com/api/v2/space/${param.space_id}"
    request_headers = {
      Content-Type  = "application/json"
      Authorization = param.token
    }

    request_body = jsonencode(
      {
        name    = param.name
        private = param.private
      }
    )

  }

  output "response_body" {
    value = step.http.update_space.response_body
  }
  output "response_headers" {
    value = step.http.update_space.response_headers
  }
  output "status_code" {
    value = step.http.update_space.status_code
  }
}