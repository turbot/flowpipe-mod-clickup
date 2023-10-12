pipeline "get_space" {
  description = "Get a space by ID."

  param "token" {
    type    = string
    default = var.token
  }

  param "space_id" {
    type = number
  }

  step "http" "get_space" {
    url = "https://api.clickup.com/api/v2/space/${param.space_id}"
    request_headers = {
      Authorization = param.token
    }
  }

  output "response_body" {
    value = step.http.get_space.response_body
  }
  output "response_headers" {
    value = step.http.get_space.response_headers
  }
  output "status_code" {
    value = step.http.get_space.status_code
  }
}