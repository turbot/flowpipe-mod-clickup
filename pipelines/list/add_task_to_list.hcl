pipeline "add_task_to_list" {
  description = "Add task to list."

  param "token" {
    type    = string
    default = var.token
  }

  param "list_id" {
    type = number
  }

  param "task_id" {
    type = string
  }

  step "http" "add_task_to_list" {
    method = "post"
    url    = "https://api.clickup.com/api/v2/list/${param.list_id}/task/${param.task_id}"
    request_headers = {
      Authorization = param.token
    }
  }

  output "response_body" {
    value = step.http.add_task_to_list.response_body
  }
  output "response_headers" {
    value = step.http.add_task_to_list.response_headers
  }
  output "status_code" {
    value = step.http.add_task_to_list.status_code
  }
}