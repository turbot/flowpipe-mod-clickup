pipeline "update_space" {
  title       = "Update Space"
  description = "Update a space."

  param "api_token" {
    description = "The ClickUp API token."
    type        = string
    default     = var.api_token
  }

  param "space_id" {
    description = "The ID of the space to update."
    type        = number
  }

  param "space" {
    type = object({
      name               = string
      color              = string
      private            = bool
      admin_can_manage   = bool
      multiple_assignees = bool
      features = object({
        due_dates = object({
          enabled               = bool
          start_date            = bool
          remap_due_dates       = bool
          remap_closed_due_date = bool
        })

        time_tracking = object({
          enabled = bool
        })
        tags = object({
          enabled = bool
        })
        time_estimates = object({
          enabled = bool
        })
        checklists = object({
          enabled = bool
        })
        custom_fields = object({
          enabled = bool
        })
        remap_dependencies = object({
          enabled = bool
        })
        dependency_warning = object({
          enabled = bool
        })
        portfolios = object({
          enabled = bool
        })
      })
    })
    description = "The space to update."
  }

  step "http" "update_space" {
    method = "put"
    url    = "https://api.clickup.com/api/v2/space/${param.space_id}"
    request_headers = {
      Content-Type  = "application/json"
      Authorization = param.api_token
    }

    request_body = jsonencode(
      {
        name    = param.name
        private = param.private
      }
    )
  }

  output "space" {
    value       = step.http.update_space.response_body
    description = "The updated space."
  }
}