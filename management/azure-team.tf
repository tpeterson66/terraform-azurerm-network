# azure team - used to manage the lab environments
resource "spacelift_space" "azure_team" {
  name             = "azure-team"
  parent_space_id  = spacelift_space.coretek.id
  inherit_entities = true
}