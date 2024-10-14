pipeline "list_spaces" {
  title       = "List Spaces"
  description = "View the Spaces available in a Workspace."

  param "conn" {
    type        = connection.clickup
    description = local.conn_param_description
    default     = connection.clickup.default
  }

  param "team_id" {
    type        = string
    description = "The ID of the team for which to list spaces."
  }

  step "http" "list_spaces" {
    method = "get"
    url    = "${local.clickup_api_endpoint}/team/${param.team_id}/space"

    request_headers = {
      Authorization = "${param.conn.token}"
    }
  }

  output "spaces" {
    description = "The list of spaces."
    value       = step.http.list_spaces.response_body.spaces
  }
}
