pipeline "get_list_members" {
  description = "Get members of a list by ID."

  param "token" {
    description = "ClickUp API token."
    type        = string
    default     = var.token
  }

  param "list_id" {
    description = "ClickUp list ID."
    type        = number
  }

  step "http" "get_list_members" {
    title = "Get list"
    url   = "https://api.clickup.com/api/v2/list/${param.list_id}/member"
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