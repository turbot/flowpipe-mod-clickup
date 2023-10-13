pipeline "get_list" {
  title       = "Get a List in ClickUp by ID"
  description = "This pipeline retrieves a list in ClickUp by its ID using the ClickUp API."

  param "api_token" {
    description = "ClickUp API token for authentication."
    type        = string
    default     = var.api_token
  }

  param "list_id" {
    description = "The ID of the list you want to retrieve."
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
    description = "The list retrieved from ClickUp."
  }

}