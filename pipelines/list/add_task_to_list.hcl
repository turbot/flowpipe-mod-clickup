pipeline "add_task_to_list" {
  title       = "Add a Task to a List"
  description = "Add a task to an additional list."

  param "api_token" {
    description = "The ClickUp API token."
    type        = string
    default     = var.api_token
  }

  param "list_id" {
    description = "The ID of the list to add the task to."
    type        = number
  }

  param "task_id" {
    description = "The ID of the task to add to the list."
    type        = string
  }

  step "http" "add_task_to_list" {
    method = "post"
    url    = "https://api.clickup.com/api/v2/list/${param.list_id}/task/${param.task_id}"
    request_headers = {
      Authorization = param.api_token
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