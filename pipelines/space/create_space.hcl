pipeline "create_space" {
  description = "Create a space."

  param "token" {
    type    = string
    default = var.token
  }

  param "team_id" {
    type = number
  }

  param "name" {
    type = string
  }

  param "private" {
    type = bool
  }

  step "http" "create_space" {
    method = "post"
    url    = "https://api.clickup.com/api/v2/team/${param.team_id}/space"
    request_headers = {
      Content-Type  = "application/json"
      Authorization = param.token
    }

    // We can add for more fields here as per requirement
    request_body = jsonencode(
      {
        name    = param.name
        private = param.private
      }
    )

  }

  output "response_body" {
    value = step.http.create_space.response_body
  }
  output "response_headers" {
    value = step.http.create_space.response_headers
  }
  output "status_code" {
    value = step.http.create_space.status_code
  }
}