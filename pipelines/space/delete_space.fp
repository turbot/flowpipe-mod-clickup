pipeline "delete_space" {
  title       = "Delete Space"
  description = "Delete a Space from your Workspace."

  param "api_token" {
    description = local.api_token_param_description
    type        = string
    default     = var.api_token
  }

  param "space_id" {
    description = "The ID of the space to delete."
    type        = string
  }

  step "http" "delete_space" {
    url    = "${local.clickup_api_endpoint}/space/${param.space_id}"
    method = "delete"
    request_headers = {
      Authorization = param.api_token
    }
  }
}