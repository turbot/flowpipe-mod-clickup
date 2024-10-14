pipeline "get_list" {
  title       = "Get List"
  description = "View information about a List."

  param "conn" {
    type        = connection.clickup
    description = local.conn_param_description
    default     = connection.clickup.default
  }

  param "list_id" {
    type        = number
    description = "The ID of the list to retrieve."
  }

  step "http" "get_list" {
    method = "get"
    url    = "${local.clickup_api_endpoint}/list/${param.list_id}"

    request_headers = {
      Authorization = "${param.conn.token}"
    }
  }

  output "list" {
    description = "The retrieved list."
    value       = step.http.get_list.response_body
  }
}
