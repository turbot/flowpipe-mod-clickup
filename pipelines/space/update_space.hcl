pipeline "update_space" {
  title       = "Update Space"
  description = "Update a space."

  param "api_token" {
    description = "The ClickUp API token."
    type        = string
    default     = var.api_token
  }

  param "space_id" {
    description = "The ID of the space to update."
    type        = number
  }

  param "name" {
    description = "The new name of the space."
    type        = string
  }

  param "private" {
    description = "Specify whether the space should be private."
    type        = bool
  }

  step "http" "update_space" {
    method = "put"
    url    = "https://api.clickup.com/api/v2/space/${param.space_id}"
    request_headers = {
      Content-Type  = "application/json"
      Authorization = param.api_token
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