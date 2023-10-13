pipeline "create_space" {
  title       = "Create a Space in ClickUp"
  description = "This pipeline creates a space in ClickUp using the ClickUp API."

  param "api_token" {
    description = "ClickUp API token for authentication."
    type        = string
    default     = var.api_token
  }

  param "team_id" {
    description = "The ID of the ClickUp team where you want to create the space."
    type        = number
  }

  param "name" {
    description = "The name of the space you want to create."
    type        = string
  }

  param "private" {
    description = "Specify whether the space is private (true) or public (false)."
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

  output "space" {
    description = "The space that was created."
    value       = step.http.create_space.response_body
  }
}