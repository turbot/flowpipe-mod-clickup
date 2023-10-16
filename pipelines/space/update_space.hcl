pipeline "update_space" {
  title       = "Update a Space in ClickUp by ID"
  description = "This pipeline updates a space in ClickUp by its ID using the ClickUp API."

  param "api_token" {
    description = "ClickUp API token for authentication."
    type        = string
    default     = var.api_token
  }

  param "space_id" {
    description = "The ID of the space you want to update."
    type        = number
  }

  param "name" {
    description = "The updated name of the space."
    type        = string
  }

  param "private" {
    description = "Specify whether the space should be private (true) or public (false)."
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