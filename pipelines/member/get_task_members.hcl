pipeline "get_task_members" {
  title       = "Get Members of a ClickUp Task by ID"
  description = "This pipeline retrieves the members of a ClickUp task by its ID using the ClickUp API."

  param "token" {
    description = "ClickUp API token for authentication."
    type        = string
    default     = var.token
  }

  param "task_id" {
    description = "The ID of the task for which you want to retrieve members."
    type        = string
  }

  step "http" "get_task_members" {
    url   = "https://api.clickup.com/api/v2/task/${param.task_id}/member"
    request_headers = {
      Authorization = param.token
    }
  }

  output "response_body" {
    value = step.http.get_task_members.response_body
  }
  output "response_headers" {
    value = step.http.get_task_members.response_headers
  }
  output "status_code" {
    value = step.http.get_task_members.status_code
  }
}