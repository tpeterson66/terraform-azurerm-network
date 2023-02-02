# Coretk Space - the first non-root space used for coretek resources
resource "spacelift_space" "coretek" {
  name             = "coretek"
  inherit_entities = true
}