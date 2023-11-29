pipeline "get_list" {
  title       = "Get List"
  description = "View information about a List."

  param "api_token" {
    type        = string
    description = local.api_token_param_description
    default     = var.api_token
  }

  param "list_id" {
    type        = number
    description = "The ID of the list to retrieve."
  }

  step "http" "get_list" {
    url = "${local.clickup_api_endpoint}/list/${param.list_id}"
    request_headers = {
      Authorization = param.api_token
    }
  }

  output "list" {
    description = "The retrieved list."
    value       = step.http.get_list.response_body
  }
}