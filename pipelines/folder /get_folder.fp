pipeline "get_folder" {
  title       = "Get Folder"
  description = "View the Lists within a Folder."

  param "cred" {
    type        = string
    description = local.cred_param_description
    default     = "default"
  }

  param "folder_id" {
    type        = number
    description = "The ID of the folder to retrieve."
  }

  step "http" "get_folder" {
    url = "${local.clickup_api_endpoint}/folder/${param.folder_id}"
    request_headers = {
      Authorization = "${credential.clickup[param.cred].token}"
    }
  }

  output "folder" {
    description = "The retrieved folder."
    value       = step.http.get_folder.response_body
  }
}
