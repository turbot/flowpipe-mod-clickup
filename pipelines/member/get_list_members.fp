pipeline "get_list_members" {
  title       = "Get List Members"
  description = "View the people who have access to a List."

  param "conn" {
    type        = connection.clickup
    description = local.conn_param_description
    default     = connection.clickup.default
  }

  param "list_id" {
    type        = number
    description = "The ID of the list to view members."
  }

  step "http" "get_list_members" {
    method = "get"
    url    = "${local.clickup_api_endpoint}/list/${param.list_id}/member"

    request_headers = {
      Authorization = "${param.conn.token}"
    }
  }

  output "members" {
    description = "The members of the list."
    value       = step.http.get_list_members.response_body.members
  }
}
