pipeline "update_space" {
  title       = "Update Space"
  description = "Update a Space."

  param "conn" {
    type        = connection.clickup
    description = local.conn_param_description
    default     = connection.clickup.default
  }

  param "space_id" {
    type        = number
    description = "The ID of the space to update."
  }

  param "name" {
    type        = string
    description = "The name of the space you want to create."
    optional    = true
  }

  param "private" {
    type        = bool
    description = "Whether or not the space should be private."
    optional    = true
  }

  param "due_dates" {
    type        = bool
    description = "Whether or not due dates are enabled for this space."
    optional    = true
  }

  param "start_date" {
    type        = bool
    description = "Whether or not start dates are enabled for this space."
    optional    = true
  }

  param "remap_due_dates" {
    type        = bool
    description = "Whether or not due dates should be remapped when moving tasks between lists."
    optional    = true
  }

  param "remap_closed_due_date" {
    type        = bool
    description = "Whether or not due dates should be remapped when closing tasks."
    optional    = true
  }

  param "time_tracking" {
    type        = bool
    description = "Whether or not time tracking is enabled for this space."
    optional    = true
  }

  param "tags" {
    type        = bool
    description = "Whether or not tags are enabled for this space."
    optional    = true
  }

  param "time_estimates" {
    type        = bool
    description = "Whether or not time estimates are enabled for this space."
    optional    = true
  }

  param "checklists" {
    type        = bool
    description = "Whether or not checklists are enabled for this space."
    optional    = true
  }

  param "custom_fields" {
    type        = bool
    description = "Whether or not custom fields are enabled for this space."
    optional    = true
  }

  param "remap_dependencies" {
    type        = bool
    description = "Whether or not dependencies should be remapped when moving tasks between lists."
    optional    = true
  }

  param "dependency_warning" {
    type        = bool
    description = "Whether or not a warning should be displayed when a task is dependent on another task."
    optional    = true
  }

  param "portfolios" {
    type        = bool
    description = "Whether or not portfolios are enabled for this space."
    optional    = true
  }

  step "pipeline" "get_space" {
    pipeline = pipeline.get_space
    args = {
      conn     = param.conn
      space_id = param.space_id
    }
  }

  step "http" "update_space" {
    depends_on = [step.pipeline.get_space]
    method     = "put"
    url        = "${local.clickup_api_endpoint}/space/${param.space_id}"

    request_headers = {
      Content-Type  = "application/json"
      Authorization = "${param.conn.token}"
    }

    request_body = jsonencode(
      {
        name    = coalesce(param.name, step.pipeline.get_space.output.space.name)
        private = coalesce(param.private, step.pipeline.get_space.output.space.private)
        features = {
          due_dates = {
            enabled               = coalesce(param.due_dates, step.pipeline.get_space.output.space.features.due_dates.enabled)
            start_date            = coalesce(param.start_date, step.pipeline.get_space.output.space.features.due_dates.start_date)
            remap_due_dates       = coalesce(param.remap_due_dates, step.pipeline.get_space.output.space.features.due_dates.remap_due_dates)
            remap_closed_due_date = coalesce(param.remap_closed_due_date, step.pipeline.get_space.output.space.features.due_dates.remap_closed_due_date)
          }

          tags = {
            enabled = coalesce(param.tags, step.pipeline.get_space.output.space.features.tags.enabled)
          }
          time_estimates = {
            enabled = coalesce(param.time_estimates, step.pipeline.get_space.output.space.features.time_estimates.enabled)
          }
          checklists = {
            enabled = coalesce(param.checklists, step.pipeline.get_space.output.space.features.checklists.enabled)
          }
          custom_fields = {
            enabled = coalesce(param.custom_fields, step.pipeline.get_space.output.space.features.custom_fields.enabled)
          }
          remap_dependencies = {
            enabled = coalesce(param.remap_dependencies, step.pipeline.get_space.output.space.features.remap_dependencies.enabled)
          }
          dependency_warning = {
            enabled = coalesce(param.dependency_warning, step.pipeline.get_space.output.space.features.dependency_warning.enabled)
          }
          portfolios = {
            enabled = coalesce(param.portfolios, step.pipeline.get_space.output.space.features.portfolios.enabled)
          }
        }
      }
    )
  }

  output "space" {
    description = "The updated space."
    value       = step.http.update_space.response_body
  }
}
