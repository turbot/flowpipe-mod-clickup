pipeline "delete_space" {
  title       = "Delete Space"
  description = "Delete a space from your workspace."

  param "api_token" {
    description = "The ClickUp API token."
    type        = string
    default     = var.api_token
  }

  param "space_id" {
    description = "The ID of the space to delete."
    type        = string
  }

  step "http" "delete_space" {
    url    = "https://api.clickup.com/api/v2/space/${param.space_id}"
    method = "delete"
    request_headers = {
      Authorization = param.api_token
    }
  }
}