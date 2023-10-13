pipeline "delete_folder" {
  title       = "Delete a Folder by ID"
  description = "This pipeline deletes a folder in ClickUp by its ID."

  param "api_token" {
    description = "ClickUp API token for authentication."
    type        = string
    default     = var.api_token
  }

  param "folder_id" {
    description = "The ID of the folder you want to delete."
    type        = number
  }

  step "http" "delete_folder" {
    method = "delete"
    url    = "https://api.clickup.com/api/v2/folder/${param.folder_id}"
    request_headers = {
      Authorization = param.api_token
    }
  }

}