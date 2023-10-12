pipeline "get_list" {
  description = "Get a list by ID."

  param "token" {
    description = "ClickUp API token."
    type        = string
    default     = var.token
  }

  param "list_id" {
    description = "ClickUp list ID."
    type        = number
  }

  step "http" "get_list" {
    title = "Get list"
    url   = "https://api.clickup.com/api/v2/list/${param.list_id}"
    request_headers = {
      Authorization = param.token
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