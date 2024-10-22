pipeline "list_folder_lists" {
  title       = "Get Lists"
  description = "View the Lists within a Folder."

  param "conn" {
    type        = connection.clickup
    description = local.conn_param_description
    default     = connection.clickup.default
  }

  param "folder_id" {
    type        = number
    description = "The ID of the folder to get lists."
  }

  step "http" "list_folder_lists" {
    method = "get"
    url    = "${local.clickup_api_endpoint}/folder/${param.folder_id}/list"

    request_headers = {
      Authorization = "${param.conn.token}"
    }
  }

  output "lists" {
    description = "The lists within the folder."
    value       = step.http.list_folder_lists.response_body.lists
  }
}
