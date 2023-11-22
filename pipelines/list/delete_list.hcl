pipeline "delete_list" {
  title       = "Delete List"
  description = "Delete a List from your workspace."

  param "api_token" {
    description = "The ClickUp API token."
    type        = string
    default     = var.api_token
  }

  param "list_id" {
    description = "The ID of the list to delete."
    type        = number
  }

  step "http" "delete_list" {
    method = "delete"
    url    = "https://api.clickup.com/api/v2/list/${param.list_id}"
    request_headers = {
      Content-Type  = "application/json"
      Authorization = param.api_token
    }
  }
}