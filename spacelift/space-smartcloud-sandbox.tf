# sandbox for smartcloud - full admin for smartcloud team members

resource "spacelift_space" "smartcloud_sandbox" {
  name             = "smartcloud-sandbox"
  parent_space_id  = spacelift_space.smartcloud.id
  inherit_entities = true
}