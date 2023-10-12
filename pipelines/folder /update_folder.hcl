pipeline "update_folder" {
  description = "Update a folder by ID."

  param "token" {
    type    = string
    default = var.token
  }

  param "folder_id" {
    type = number
  }

  param "name" {
    type = string
  }

  step "http" "update_folder" {
    method = "put"
    url    = "https://api.clickup.com/api/v2/folder/${param.folder_id}"
    request_headers = {
      Content-Type  = "application/json"
      Authorization = param.token
    }

    request_body = jsonencode(
      {
        name = param.name
      }
    )

  }

  output "response_body" {
    value = step.http.update_folder.response_body
  }
  output "response_headers" {
    value = step.http.update_folder.response_headers
  }
  output "status_code" {
    value = step.http.update_folder.status_code
  }
}