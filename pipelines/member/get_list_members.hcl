pipeline "get_list_members" {
  title       = "Get Members of a ClickUp List by ID"
  description = "This pipeline retrieves the members of a ClickUp list by its ID using the ClickUp API."

  param "api_token" {
    description = "ClickUp API token for authentication."
    type        = string
    default     = var.api_token
  }

  param "list_id" {
    description = "The ID of the list for which you want to retrieve members."
    type        = number
  }

  step "http" "get_list_members" {
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