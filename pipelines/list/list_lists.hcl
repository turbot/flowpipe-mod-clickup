// usage: flowpipe pipeline list lists
pipeline "list_lists" {
  description = "List all the lists."

  param "token" {
    type    = string
    default = var.token
  }

  param "folder_id" {
    type = number
  }

  step "http" "list_lists" {
    url = "https://api.clickup.com/api/v2/folder/${param.folder_id}/list"
    request_headers = {
      Authorization = param.token
    }
  }

  output "response_body" {
    value = step.http.list_lists.response_body
  }
  output "response_headers" {
    value = step.http.list_lists.response_headers
  }
  output "status_code" {
    value = step.http.list_lists.status_code
  }
}