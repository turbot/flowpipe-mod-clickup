pipeline "get_list_members" {
  title       = "Get List Members"
  description = "View the people who have access to a List."

  param "api_token" {
    type        = string
    description = local.api_token_param_description
    default     = var.api_token
  }

  param "list_id" {
    type        = number
    description = "The ID of the list to view members."
  }

  step "http" "get_list_members" {
    url = "${local.clickup_api_endpoint}/list/${param.list_id}/member"
    request_headers = {
      Authorization = param.token
    }
  }

  output "members" {
    description = "The members of the list."
    value       = step.http.get_list_members.response_body.members
  }
}