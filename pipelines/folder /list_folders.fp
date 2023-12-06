pipeline "list_folders" {
  title       = "List Folders"
  description = "View the Folders in a Space."

  param "cred" {
    type        = string
    description = local.cred_param_description
    default     = "default"
  }

  param "cred" {
    type        = string
    description = local.cred_param_description
    default     = "default"
  }


  param "space_id" {
    type        = number
    description = "The ID of the space to list folders."
  }

  step "http" "list_folders" {
    method = "get"
    url    = "${local.clickup_api_endpoint}/space/${param.space_id}/folder"

    request_headers = {
      Authorization = "${credential.clickup[param.cred].token}"
    }
  }

  output "folders" {
    description = "The folders in the space."
    value       = step.http.list_folders.response_body.folders
  }
}
