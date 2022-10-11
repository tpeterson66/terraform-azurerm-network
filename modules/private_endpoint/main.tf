# variables
variable "name" {
  description = "Specifies the Name of the Private Endpoint. Changing this forces a new resource to be created."
  type        = string
}
variable "location" {
  description = "The supported Azure location where the resource exists. Changing this forces a new resource to be created."
  type        = string
}
variable "resource_group_name" {
  description = "Specifies the Name of the Resource Group within which the Private Endpoint should exist. Changing this forces a new resource to be created."
  type        = string
}
variable "subnet_id" {
  description = "The ID of the Subnet from which Private IP Addresses will be allocated for this Private Endpoint. Changing this forces a new resource to be created."
  type        = string
}
variable "private_service_connection_name" {
  description = "Specifies the Name of the Private Service Connection. Changing this forces a new resource to be created."
  type        = string
}
variable "private_connection_resource_id" {
  description = "The ID of the Private Link Enabled Remote Resource which this Private Endpoint should be connected to. One of private_connection_resource_id or private_connection_resource_alias must be specified. Changing this forces a new resource to be created."
  type        = string
}
variable "is_manual_connection" {
  description = "Does the Private Endpoint require Manual Approval from the remote resource owner? Changing this forces a new resource to be created."
  type        = bool
}
variable "subresource_names" {
  description = "A list of subresource names which the Private Endpoint is able to connect to. subresource_names corresponds to group_id. Changing this forces a new resource to be created."
  type        = list(string)
}
variable "private_dns_zone_group_name" {
  description = "Specifies the Name of the Private Service Connection. Changing this forces a new resource to be created."
  type        = string
}
variable "private_dns_zone_ids" {
  description = "Specifies the list of Private DNS Zones to include within the private_dns_zone_group."
  type        = list(string)
}

# resources

# private endpoint
# https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/private_endpoint
resource "azurerm_private_endpoint" "this" {
    name                = var.name
    location            = var.location
    resource_group_name = var.resource_group_name
    subnet_id           = var.subnet_id

    private_service_connection {
        name                            = var.private_service_connection_name
        private_connection_resource_id  = var.private_connection_resource_id
        is_manual_connection            = var.is_manual_connection
        subresource_names               = var.subresource_names
    }
    private_dns_zone_group {
        name                 = var.private_dns_zone_group_name
        private_dns_zone_ids = var.private_dns_zone_ids
    }
}

# outputs 

output "id" {
  value       = azurerm_private_endpoint.this.id
  description = "The ID of the Private Endpoint."
}

output "name" {
  value       = azurerm_private_endpoint.this.name
  description = "The name of the Private Endpoint."
}


