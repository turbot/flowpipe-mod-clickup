pipeline "create_list" {
  title       = "Create List"
  description = "Add a new List to a Folder."

  param "api_token" {
    type        = string
    description = local.api_token_param_description
    default     = var.api_token
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
      Authorization = param.api_token
    }

    # We can add more fields here as per requirements
    request_body = jsonencode(
      {
        name     = param.name
        assignee = param.assignee
      }
    )
  }

  output "list" {
    description = "The newly created list."
    value       = step.http.create_list.response_body
  }
}
