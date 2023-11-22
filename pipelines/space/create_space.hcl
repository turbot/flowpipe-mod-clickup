pipeline "create_space" {
  title       = "Create a Space"
  description = "Add a new space to a workspace."

  param "api_token" {
    description = "The ClickUp API token."
    type        = string
    default     = var.api_token
  }

  param "team_id" {
    description = "The ID of the team where the space will be created."
    type        = number
  }

  param "name" {
    description = "The name of the space you want to create."
    type        = string
  }

  param "private" {
    description = "Specify whether the space is private."
    type        = bool
  }

  step "http" "create_space" {
    method = "post"
    url    = "https://api.clickup.com/api/v2/team/${param.team_id}/space"
    request_headers = {
      Content-Type  = "application/json"
      Authorization = param.api_token
    }

    // Additional fields can be added here as needed
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