pipeline "list_spaces" {
  title       = "List All Spaces in ClickUp"
  description = "This pipeline lists all spaces in ClickUp using the ClickUp API."

  param "api_token" {
    description = "ClickUp API token for authentication."
    type        = string
    default     = var.api_token
  }

  param "team_id" {
    description = "The ID of the team for which you want to list spaces."
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
    description = "The list of spaces in the team."
  }

}