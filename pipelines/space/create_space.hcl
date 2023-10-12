pipeline "create_space" {
  description = "Create a space."

  param "token" {
    description = "ClickUp API token."
    type        = string
    default     = var.token
  }

  param "team_id" {
    description = "ClickUp team ID."
    type        = number
  }

  param "name" {
    description = "Name of the space."
    type        = string
  }

  param "private" {
    description = "Whether the space is private or not."
    type        = bool
  }

  step "http" "create_space" {
    title  = "Create a space"
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