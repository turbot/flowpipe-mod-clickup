pipeline "get_folder" {
  description = "Get a folder by ID."

  param "token" {
    type    = string
    default = var.token
  }

  param "folder_id" {
    type = number
  }

  step "http" "get_folder" {
    url = "https://api.clickup.com/api/v2/folder/${param.folder_id}"
    request_headers = {
      Authorization = param.token
    }
  }

  output "response_body" {
    value = step.http.get_folder.response_body
  }
  output "response_headers" {
    value = step.http.get_folder.response_headers
  }
  output "status_code" {
    value = step.http.get_folder.status_code
  }
}