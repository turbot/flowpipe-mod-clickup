pipeline "get_space" {
  title       = "Get Space"
  description = "View the Spaces available in a Workspace."

  param "api_token" {
    description = local.api_token_param_description
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