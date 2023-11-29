pipeline "create_space" {
  title       = "Create Space"
  description = "Add a new Space to a Workspace."

  param "api_token" {
    description = local.api_token_param_description
    type        = string
    default     = var.api_token
  }

  param "team_id" {
    description = "The ID of the team where the space will be created."
    type        = number
  }

  param "space" {
    type = object({
      name               = string
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
    description = "The space to create."
  }

  step "http" "create_space" {
    method = "post"
    url    = "${local.clickup_api_endpoint}/team/${param.team_id}/space"
    request_headers = {
      Content-Type  = "application/json"
      Authorization = param.api_token
    }

    // Additional fields can be added here as needed
    request_body = jsonencode(param.space)
  }

  output "space" {
    value       = step.http.create_space.response_body
    description = "The newly created space."
  }
}