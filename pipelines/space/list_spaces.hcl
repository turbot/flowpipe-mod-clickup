// usage: flowpipe pipeline list spaces
pipeline "list_spaces" {
  description = "List all spaces."

  param "token" {
    type    = string
    default = var.token
  }

  param "team_id" {
    type = string
  }

  step "http" "list_spaces" {
    url = "https://api.clickup.com/api/v2/team/${param.team_id}/space"
    request_headers = {
      Authorization = param.token
    }
  }

  output "response_body" {
    description = "Response body."
    value       = step.http.list_spaces.response_body
  }
  output "response_headers" {
    value = step.http.list_spaces.response_headers
  }
  output "status_code" {
    value = step.http.list_spaces.status_code
  }
}