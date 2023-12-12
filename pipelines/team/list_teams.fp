pipeline "list_teams" {
  title       = "List Teams"
  description = "View the Teams (Workspaces) available to the authenticated user."

  param "cred" {
    type        = string
    description = local.cred_param_description
    default     = "default"
  }

  step "http" "list_teams" {
    method = "get"
    url    = "${local.clickup_api_endpoint}/team"

    request_headers = {
      Authorization = "${credential.clickup[param.cred].token}"
      Content-Type  = "application/json"
    }
  }

  output "teams" {
    description = "List of teams."
    value       = step.http.list_teams.response_body.teams
  }
}
