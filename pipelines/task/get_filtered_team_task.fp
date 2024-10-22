pipeline "get_filtered_team_task" {
  title       = "Get Filtered Team Tasks"
  description = "View the tasks that meet specific criteria from a Workspace. Responses are limited to 100 tasks per page."

  param "conn" {
    type        = connection.clickup
    description = local.conn_param_description
    default     = connection.clickup.default
  }

  param "team_id" {
    type        = number
    description = "The ID of the team for which to retrieve tasks."
  }

  step "http" "get_filtered_team_task" {
    method = "get"
    url    = "${local.clickup_api_endpoint}/team/${param.team_id}/task?page=0"

    request_headers = {
      Authorization = "${param.conn.token}"
    }

    loop {
      until = result.response_body.last_page == true
      url   = "${local.clickup_api_endpoint}/team/${param.team_id}/task?page=${loop.index + 1}"
    }
  }

  output "tasks" {
    description = "The tasks that meet the specified criteria."
    value       = flatten([for page, tasks in step.http.get_filtered_team_task : tasks.response_body.tasks])
  }
}
