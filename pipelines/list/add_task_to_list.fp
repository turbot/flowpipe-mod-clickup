pipeline "add_task_to_list" {
  title       = "Add Task to List"
  description = "Add a task to an additional List."

  tags = {
    type = "featured"
  }

  param "conn" {
    type        = connection.clickup
    description = local.conn_param_description
    default     = connection.clickup.default
  }

  param "list_id" {
    type        = number
    description = "The ID of the list to add the task to."
  }

  param "task_id" {
    type        = string
    description = "The ID of the task to add to the list."
  }

  step "http" "add_task_to_list" {
    method = "post"
    url    = "${local.clickup_api_endpoint}/list/${param.list_id}/task/${param.task_id}"

    request_headers = {
      Authorization = "${param.conn.token}"
    }
  }
}
