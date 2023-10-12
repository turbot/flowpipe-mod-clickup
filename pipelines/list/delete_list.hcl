pipeline "delete_list" {
  description = "Delete a list by ID."

  param "token" {
    description = "ClickUp API token."
    type        = string
    default     = var.token
  }

  param "list_id" {
    description = "ClickUp list ID."
    type        = number
  }

  step "http" "delete_list" {
    title  = "Delete a list"
    url    = "https://api.clickup.com/api/v2/list/${param.list_id}"
    method = "delete"
    request_headers = {
      Content-Type  = "application/json"
      Authorization = param.token
    }
  }

  output "response_body" {
    value = step.http.delete_list.response_body
  }
  output "response_headers" {
    value = step.http.delete_list.response_headers
  }
  output "status_code" {
    value = step.http.delete_list.status_code
  }
}