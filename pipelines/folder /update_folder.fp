pipeline "update_folder" {
  title       = "Update Folder"
  description = "Rename a Folder."

  param "conn" {
    type        = connection.clickup
    description = local.conn_param_description
    default     = connection.clickup.default
  }

  param "folder_id" {
    type        = number
    description = "The ID of the folder to update."
  }

  param "name" {
    type        = string
    description = "New name for the folder."
  }

  step "http" "update_folder" {
    method = "put"
    url    = "${local.clickup_api_endpoint}/folder/${param.folder_id}"

    request_headers = {
      Content-Type  = "application/json"
      Authorization = "${param.conn.token}"
    }

    request_body = jsonencode({
      for name, value in param : name => value if value != null
    })
  }

  output "folder" {
    description = "The updated folder."
    value       = step.http.update_folder.response_body
  }
}
