pipeline "get_space" {
  title       = "Get Space"
  description = "View the Spaces available in a Workspace."

  param "conn" {
    type        = connection.clickup
    description = local.conn_param_description
    default     = connection.clickup.default
  }

  param "space_id" {
    type        = number
    description = "The ID of the space to retrieve."
  }

  step "http" "get_space" {
    method = "get"
    url    = "${local.clickup_api_endpoint}/space/${param.space_id}"

    request_headers = {
      Authorization = "${param.conn.token}"
    }
  }

  output "space" {
    description = "The retrieved space."
    value       = step.http.get_space.response_body
  }
}
