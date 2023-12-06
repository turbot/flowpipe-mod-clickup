pipeline "get_space" {
  title       = "Get Space"
  description = "View the Spaces available in a Workspace."

  param "cred" {
    type        = string
    description = local.cred_param_description
    default     = "default"
  }

  param "space_id" {
    type        = number
    description = "The ID of the space to retrieve."
  }

  step "http" "get_space" {
    method = "get"
    url    = "${local.clickup_api_endpoint}/space/${param.space_id}"

    request_headers = {
      Authorization = "${credential.clickup[param.cred].token}"
    }
  }

  output "space" {
    description = "The retrieved space."
    value       = step.http.get_space.response_body
  }
}
