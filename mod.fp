mod "clickup" {
  title         = "ClickUp"
  description   = "Run pipelines to supercharge your ClickUp workflows using Flowpipe."
  color         = "#7B68EE"
  documentation = file("./README.md")
  icon          = "/images/mods/turbot/clickup.svg"
  categories    = ["library", "productivity"]

  opengraph {
    title       = "ClickUp Mod for Flowpipe"
    description = "Run pipelines to supercharge your ClickUp workflows using Flowpipe."
    image       = "/images/mods/turbot/clickup-social-graphic.png"
  }

  require {
    flowpipe {
      min_version = "1.0.0"
    }
  }
}
