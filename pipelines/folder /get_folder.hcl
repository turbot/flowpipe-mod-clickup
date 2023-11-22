pipeline "get_folder" {
  title       = "Get Folder"
  description = "View the lists within a folder."

  param "api_token" {
    description = "The ClickUp API token."
    type        = string
    default     = var.api_token
  }

  param "folder_id" {
    description = "The ID of the folder to retrieve."
    type        = number
  }

  step "http" "get_folder" {
    url = "https://api.clickup.com/api/v2/folder/${param.folder_id}"
    request_headers = {
      Authorization = param.api_token
    }
  }

  output "response_body" {
    value = step.http.get_folder.response_body
  }
  output "response_headers" {
    value = step.http.get_folder.response_headers
  }
  output "status_code" {
    value = step.http.get_folder.status_code
  }
}