pipeline "get_list" {
  title       = "Get a List"
  description = "View information about a list."

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

  output "response_body" {
    value = step.http.get_list.response_body
  }
  output "response_headers" {
    value = step.http.get_list.response_headers
  }
  output "status_code" {
    value = step.http.get_list.status_code
  }
}