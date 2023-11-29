pipeline "delete_folder" {
  title       = "Delete Folder"
  description = "Delete a Folder from your Workspace."

  param "api_token" {
    type        = string
    description = local.api_token_param_description
    default     = var.api_token
  }

  param "folder_id" {
    type        = number
    description = "The ID of the folder to delete."
  }

  step "http" "delete_folder" {
    method = "delete"
    url    = "${local.clickup_api_endpoint}/folder/${param.folder_id}"
    request_headers = {
      Authorization = param.api_token
    }
  }
}