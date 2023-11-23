pipeline "delete_folder" {
  title       = "Delete Folder"
  description = "Delete a Folder from your Workspace."

  param "api_token" {
    description = "The ClickUp API token."
    type        = string
    default     = var.api_token
  }

  param "folder_id" {
    description = "The ID of the folder to delete."
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