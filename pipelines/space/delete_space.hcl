pipeline "delete_space" {
  title       = "Delete a Space"
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

  output "response_body" {
    value = step.http.delete_space.response_body
  }
  output "response_headers" {
    value = step.http.delete_space.response_headers
  }
  output "status_code" {
    value = step.http.delete_space.status_code
  }
}