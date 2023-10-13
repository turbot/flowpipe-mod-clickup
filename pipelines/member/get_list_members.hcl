pipeline "get_list_members" {
  title       = "Get Members of a ClickUp List by ID"
  description = "This pipeline retrieves the members of a ClickUp list by its ID using the ClickUp API."

  param "api_token" {
    description = "ClickUp API api_token for authentication."
    type        = string
    default     = var.api_token
  }

  param "list_id" {
    description = "The ID of the list for which you want to retrieve members."
    type        = number
  }

  step "http" "get_list_members" {
    url = "https://api.clickup.com/api/v2/list/${param.list_id}/member"
    request_headers = {
      Authorization = param.api_token
    }
  }

  output "members" {
    value       = step.http.get_list_members.response_body
    description = "The members of the list."
  }

}