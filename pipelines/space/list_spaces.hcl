pipeline "list_spaces" {
  title       = "List All Spaces"
  description = "View the spaces avialable in a workspace."

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

  output "response_body" {
    value = step.http.list_spaces.response_body
  }
  output "response_headers" {
    value = step.http.list_spaces.response_headers
  }
  output "status_code" {
    value = step.http.list_spaces.status_code
  }
}