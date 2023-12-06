pipeline "create_folder" {
  title       = "Create New Folder"
  description = "Add a new Folder to a Space."

  param "cred" {
    type        = string
    description = local.cred_param_description
    default     = "default"
  }

  param "space_id" {
    type        = number
    description = "The ID of the space where the new folder will be created."
  }

  param "name" {
    type        = string
    description = "The name of the folder to create."
  }

  step "http" "create_folder" {
    method = "post"
    url    = "${local.clickup_api_endpoint}/space/${param.space_id}/folder"

    request_headers = {
      Content-Type  = "application/json"
      Authorization = "${credential.clickup[param.cred].token}"
    }

    request_body = jsonencode({
      for name, value in param : name => value if value != null
    })

  }

  output "folder" {
    description = "The newly created folder."
    value       = step.http.create_folder.response_body
  }
}
