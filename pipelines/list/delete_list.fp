pipeline "delete_list" {
  title       = "Delete List"
  description = "Delete a List from your Workspace."

  param "conn" {
    type        = connection.clickup
    description = local.conn_param_description
    default     = connection.clickup.default
  }

  param "list_id" {
    type        = number
    description = "The ID of the list to delete."
  }

  step "http" "delete_list" {
    method = "delete"
    url    = "${local.clickup_api_endpoint}/list/${param.list_id}"

    request_headers = {
      Content-Type  = "application/json"
      Authorization = "${param.conn.token}"
    }
  }
}
