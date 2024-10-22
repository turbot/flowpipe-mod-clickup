pipeline "delete_folder" {
  title       = "Delete Folder"
  description = "Delete a Folder from your Workspace."

  param "conn" {
    type        = connection.clickup
    description = local.conn_param_description
    default     = connection.clickup.default
  }

  param "folder_id" {
    type        = number
    description = "The ID of the folder to delete."
  }

  step "http" "delete_folder" {
    method = "delete"
    url    = "${local.clickup_api_endpoint}/folder/${param.folder_id}"

    request_headers = {
      Authorization = "${param.conn.token}"
    }
  }
}
