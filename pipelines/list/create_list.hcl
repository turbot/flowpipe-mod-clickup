pipeline "create_list" {
  title       = "Create List"
  description = "Add a new list to a folder."

  param "api_token" {
    description = "The ClickUp API token."
    type        = string
    default     = var.api_token
  }

  param "folder_id" {
    description = "The ID of the folder where the new list will be created."
    type        = number
  }

  param "name" {
    description = "The name of the list to create."
    type        = string
  }

  param "assignee" {
    description = "The ID of the user to assign this list."
    optional    = true
    type        = number
  }

  step "http" "create_list" {
    method = "post"
    url    = "https://api.clickup.com/api/v2/folder/${param.folder_id}/list"
    request_headers = {
      Content-Type  = "application/json"
      Authorization = param.api_token
    }

    // We can add more fields here as per requirements
    request_body = jsonencode(
      {
        name     = param.name
        assignee = param.assignee
      }
    )
  }

  output "list" {
    value       = step.http.create_list.response_body
    description = "The newly created list."
  }
}