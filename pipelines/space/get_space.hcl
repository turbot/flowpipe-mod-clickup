pipeline "get_space" {
  title       = "Get a Space in ClickUp by ID"
  description = "This pipeline retrieves a space in ClickUp by its ID using the ClickUp API."

  param "api_token" {
    description = "ClickUp API token for authentication."
    type        = string
    default     = var.api_token
  }

  param "space_id" {
    description = "The ID of the space you want to retrieve."
    type        = number
  }

  step "http" "get_space" {
    url = "https://api.clickup.com/api/v2/space/${param.space_id}"
    request_headers = {
      Authorization = param.api_token
    }
  }

  output "space" {
    value       = step.http.get_space.response_body
    description = "The space retrieved from ClickUp."
  }

}