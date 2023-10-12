pipeline "delete_space" {
  description = "Delete a space by ID."

  param "token" {
    type    = string
    default = var.token
  }

  param "space_id" {
    type = string
  }

  step "http" "delete_space" {
    url    = "https://api.clickup.com/api/v2/space/${param.space_id}"
    method = "delete"
    request_headers = {
      Authorization = param.token
    }
  }

  output "response_body" {
    value = step.http.delete_space.response_body
  }
  output "response_headers" {
    value = step.http.delete_space.response_headers
  }
  output "status_code" {
    value = step.http.delete_space.status_code
  }
}