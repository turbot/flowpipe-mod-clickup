pipeline "delete_folder" {
  title       = "Delete Folder"
  description = "Delete a Folder from your Workspace."

  param "cred" {
    type        = string
    description = local.cred_param_description
    default     = "default"
  }

  param "folder_id" {
    type        = number
    description = "The ID of the folder to delete."
  }

  step "http" "delete_folder" {
    method = "delete"
    url    = "${local.clickup_api_endpoint}/folder/${param.folder_id}"

    request_headers = {
      Authorization = "${credential.clickup[param.cred].token}"
    }
  }
}
