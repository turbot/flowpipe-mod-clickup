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
    title  = "Delete Folder Request"
    method = "delete"
    url    = "https://api.clickup.com/api/v2/folder/${param.folder_id}"
    request_headers = {
      Authorization = param.api_token
    }
  }

  output "response_body" {
    value = step.http.delete_folder.response_body
  }
  output "response_headers" {
    value = step.http.delete_folder.response_headers
  }
  output "status_code" {
    value = step.http.delete_folder.status_code
  }
}