pipeline "delete_space" {
  title       = "Delete a Space in ClickUp by ID"
  description = "This pipeline deletes a space in ClickUp by its ID using the ClickUp API."

  param "api_token" {
    description = "ClickUp API token for authentication."
    type        = string
    default     = var.api_token
  }

  param "space_id" {
    description = "The ID of the space you want to delete."
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