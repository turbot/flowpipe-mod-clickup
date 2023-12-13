pipeline "delete_space" {
  title       = "Delete Space"
  description = "Delete a Space from your Workspace."

  param "cred" {
    type        = string
    description = local.cred_param_description
    default     = "default"
  }

  param "space_id" {
    type        = string
    description = "The ID of the space to delete."
  }

  step "http" "delete_space" {
    method = "delete"
    url    = "${local.clickup_api_endpoint}/space/${param.space_id}"

    request_headers = {
      Authorization = "${credential.clickup[param.cred].token}"
    }
  }
}
