pipeline "get_space" {
  title       = "Get Space"
  description = "View the spaces available in a workspace."

  param "api_token" {
    description = "The ClickUp API token."
    type        = string
    default     = var.api_token
  }

  param "space_id" {
    description = "The ID of the space to retrieve."
    type        = number
  }

  step "http" "get_space" {
    url = "https://api.clickup.com/api/v2/space/${param.space_id}"
    request_headers = {
      Authorization = param.api_token
    }
  }

  output "space" {
    value       = step.http.get_space.response_body
    description = "The retrieved space."
  }
}