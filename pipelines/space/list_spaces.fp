pipeline "list_spaces" {
  title       = "List Spaces"
  description = "View the Spaces available in a Workspace."

  param "api_token" {
    type        = string
    description = local.api_token_param_description
    default     = var.api_token
  }

  param "team_id" {
    type        = string
    description = "The ID of the team for which to list spaces."
  }

  step "http" "list_spaces" {
    url = "${local.clickup_api_endpoint}/team/${param.team_id}/space"
    request_headers = {
      Authorization = param.api_token
    }
  }

  output "spaces" {
    description = "The list of spaces."
    value       = step.http.list_spaces.response_body.spaces
  }
}