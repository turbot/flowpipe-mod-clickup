pipeline "get_folder" {
  title       = "Get Folder"
  description = "View the Lists within a Folder."

  param "conn" {
    type        = connection.clickup
    description = local.conn_param_description
    default     = connection.clickup.default
  }

  param "folder_id" {
    type        = number
    description = "The ID of the folder to retrieve."
  }

  step "http" "get_folder" {
    url = "${local.clickup_api_endpoint}/folder/${param.folder_id}"
    request_headers = {
      Authorization = "${param.conn.token}"
    }
  }

  output "folder" {
    description = "The retrieved folder."
    value       = step.http.get_folder.response_body
  }
}
