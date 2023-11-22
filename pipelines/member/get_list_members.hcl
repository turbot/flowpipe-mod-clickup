pipeline "get_list_members" {
  title       = "Get List Members"
  description = "View the people who have access to a list."

  param "api_token" {
    description = "The ClickUp API token."
    type        = string
    default     = var.api_token
  }

  param "list_id" {
    description = "The ID of the list to view members."
    type        = number
  }

  step "http" "get_list_members" {
    url = "https://api.clickup.com/api/v2/list/${param.list_id}/member"
    request_headers = {
      Authorization = param.token
    }
  }

  output "response_body" {
    value = step.http.get_list_members.response_body
  }
  output "response_headers" {
    value = step.http.get_list_members.response_headers
  }
  output "status_code" {
    value = step.http.get_list_members.status_code
  }
}