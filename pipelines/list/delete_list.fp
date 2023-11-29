pipeline "delete_list" {
  title       = "Delete List"
  description = "Delete a List from your Workspace."

  param "api_token" {
    type        = string
    description = local.api_token_param_description
    default     = var.api_token
  }

  param "list_id" {
    type        = number
    description = "The ID of the list to delete."
  }

  step "http" "delete_list" {
    method = "delete"
    url    = "${local.clickup_api_endpoint}/list/${param.list_id}"
    request_headers = {
      Content-Type  = "application/json"
      Authorization = param.api_token
    }
  }
}