pipeline "list_spaces" {
  title       = "List Spaces"
  description = "View the Spaces available in a Workspace."

  param "api_token" {
    description = "The ClickUp API token."
    type        = string
    default     = var.api_token
  }

  param "team_id" {
    description = "The ID of the team for which to list spaces."
    type        = string
  }

  step "http" "list_spaces" {
    url = "https://api.clickup.com/api/v2/team/${param.team_id}/space"
    request_headers = {
      Authorization = param.api_token
    }
  }

  output "spaces" {
    value       = step.http.list_spaces.response_body.spaces
    description = "The list of spaces."
  }
}