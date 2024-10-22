pipeline "delete_space" {
  title       = "Delete Space"
  description = "Delete a Space from your Workspace."

  param "conn" {
    type        = connection.clickup
    description = local.conn_param_description
    default     = connection.clickup.default
  }

  param "space_id" {
    type        = string
    description = "The ID of the space to delete."
  }

  step "http" "delete_space" {
    method = "delete"
    url    = "${local.clickup_api_endpoint}/space/${param.space_id}"

    request_headers = {
      Authorization = "${param.conn.token}"
    }
  }
}
