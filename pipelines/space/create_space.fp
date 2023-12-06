pipeline "create_space" {
  title       = "Create Space"
  description = "Add a new Space to a Workspace."

  param "cred" {
    type        = string
    description = local.cred_param_description
    default     = "default"
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
      Authorization = "${credential.clickup[param.cred].token}"
    }

    request_body = jsonencode({
      for name, value in param : name => value if value != null
    })

  }

  output "space" {
    description = "The newly created space."
    value       = step.http.create_space.response_body
  }
}
