pipeline "get_space" {
  title       = "Get Space"
  description = "View the Spaces available in a Workspace."

  param "api_token" {
    type        = string
    description = local.api_token_param_description
    default     = var.api_token
  }

  param "space_id" {
    type        = number
    description = "The ID of the space to retrieve."
  }

  step "http" "get_space" {
    url = "${local.clickup_api_endpoint}/space/${param.space_id}"
    request_headers = {
      Authorization = param.api_token
    }
  }

  output "space" {
    description = "The retrieved space."
    value       = step.http.get_space.response_body
  }
}