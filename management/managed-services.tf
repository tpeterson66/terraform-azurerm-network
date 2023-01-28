# managed-services - used to manage customer environemnts
resource "spacelift_space" "managed_services" {
  name             = "azure-managed-services"
  parent_space_id  = spacelift_space.coretek.id
  inherit_entities = true
}