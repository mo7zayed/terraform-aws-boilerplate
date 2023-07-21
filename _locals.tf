locals {
  project = yamldecode(file("./config/global_values.yaml"))["project"]
  global_tags = merge(
    yamldecode(file("./config/global_tags.yaml")),
  )
}
