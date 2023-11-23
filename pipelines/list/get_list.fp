pipeline "get_list" {
  title       = "Get List"
  description = "View information about a List."

  param "api_token" {
    description = "The ClickUp API token."
    type        = string
    default     = var.api_token
  }

  param "list_id" {
    description = "The ID of the list to retrieve."
    type        = number
  }

  step "http" "get_list" {
    url = "https://api.clickup.com/api/v2/list/${param.list_id}"
    request_headers = {
      Authorization = param.api_token
    }
  }

  output "list" {
    value       = step.http.get_list.response_body
    description = "The retrieved list."
  }
}