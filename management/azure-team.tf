# azure team - used to manage the lab environments
resource "spacelift_space" "azure_team" {
  name             = "smartcloud-demo"
  parent_space_id  = spacelift_space.coretek.id
  inherit_entities = true
}