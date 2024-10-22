pipeline "create_list" {
  title       = "Create List"
  description = "Add a new List to a Folder."

  param "conn" {
    type        = connection.clickup
    description = local.conn_param_description
    default     = connection.clickup.default
  }

  param "folder_id" {
    type        = number
    description = "The ID of the folder where the new list will be created."
  }

  param "name" {
    type        = string
    description = "The name of the list to create."
  }

  param "assignee" {
    optional    = true
    description = "The ID of the user to assign this list."
    type        = number
  }

  step "http" "create_list" {
    method = "post"
    url    = "${local.clickup_api_endpoint}/folder/${param.folder_id}/list"

    request_headers = {
      Content-Type  = "application/json"
      Authorization = "${param.conn.token}"
    }

    # We can add more fields here as per requirements
    request_body = jsonencode({
      for name, value in param : name => value if value != null
    })

  }

  output "list" {
    description = "The newly created list."
    value       = step.http.create_list.response_body
  }
}
