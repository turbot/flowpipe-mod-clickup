pipeline "create_space" {
  title       = "Create Space"
  description = "Add a new Space to a Workspace."

  param "api_token" {
    type        = string
    description = local.api_token_param_description
    default     = var.api_token
  }

  param "team_id" {
    type        = number
    description = "The ID of the team where the space will be created."
  }

  param "name" {
    type        = string
    description = "The name of the space you want to create."
  }

  param "private" {
    type        = bool
    description = "Whether or not the space should be private."
    default     = false
  }

  param "multiple_assignees" {
    type        = bool
    description = "Whether or not tasks in this space can have multiple assignees."
    default     = true
  }

  param "due_dates" {
    type        = bool
    description = "Whether or not due dates are enabled for this space."
    default     = true
  }

  param "start_date" {
    type        = bool
    description = "Whether or not start dates are enabled for this space."
    default     = false
  }

  param "remap_due_dates" {
    type        = bool
    description = "Whether or not due dates should be remapped when moving tasks between lists."
    default     = true
  }

  param "remap_closed_due_date" {
    type        = bool
    description = "Whether or not due dates should be remapped when closing tasks."
    default     = false
  }

  param "time_tracking" {
    type        = bool
    description = "Whether or not time tracking is enabled for this space."
    default     = false
  }

  param "tags" {
    type        = bool
    description = "Whether or not tags are enabled for this space."
    default     = true
  }

  param "time_estimates" {
    type        = bool
    description = "Whether or not time estimates are enabled for this space."
    default     = true
  }

  param "checklists" {
    type        = bool
    description = "Whether or not checklists are enabled for this space."
    default     = true
  }

  param "custom_fields" {
    type        = bool
    description = "Whether or not custom fields are enabled for this space."
    default     = true
  }

  param "remap_dependencies" {
    type        = bool
    description = "Whether or not dependencies should be remapped when moving tasks between lists."
    default     = true
  }

  param "dependency_warning" {
    type        = bool
    description = "Whether or not a warning should be displayed when a task is dependent on another task."
    default     = true
  }

  param "portfolios" {
    type        = bool
    description = "Whether or not portfolios are enabled for this space."
    default     = true
  }

  step "http" "create_space" {
    method = "post"
    url    = "${local.clickup_api_endpoint}/team/${param.team_id}/space"
    request_headers = {
      Content-Type  = "application/json"
      Authorization = param.api_token
    }

    request_body = jsonencode(
      {
        name               = param.name
        multiple_assignees = param.multiple_assignees
        private            = param.private
        features = {
          due_dates = {
            enabled               = param.due_dates
            start_date            = param.start_date
            remap_due_dates       = param.remap_due_dates
            remap_closed_due_date = param.remap_closed_due_date
          }

          time_tracking = {
            enabled = param.time_tracking
          }
          tags = {
            enabled = param.tags
          }
          time_estimates = {
            enabled = param.time_estimates
          }
          checklists = {
            enabled = param.checklists
          }
          custom_fields = {
            enabled = param.custom_fields
          }
          remap_dependencies = {
            enabled = param.remap_dependencies
          }
          dependency_warning = {
            enabled = param.dependency_warning
          }
          portfolios = {
            enabled = param.portfolios
          }
        }
      }
    )
  }

  output "space" {
    description = "The newly created space."
    value       = step.http.create_space.response_body
  }
}
