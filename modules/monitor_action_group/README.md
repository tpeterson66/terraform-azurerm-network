<!-- BEGIN_TF_DOCS -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_azurerm"></a> [azurerm](#requirement\_azurerm) | 3.26.0 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_azurerm"></a> [azurerm](#provider\_azurerm) | 3.26.0 |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [azurerm_monitor_action_group.this](https://registry.terraform.io/providers/hashicorp/azurerm/3.26.0/docs/resources/monitor_action_group) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_arm_role_receiver"></a> [arm\_role\_receiver](#input\_arm\_role\_receiver) | List of objects with name, role\_id and use\_common\_alert\_schema | <pre>list(object({<br>      name                    = string<br>      role_id                 = string<br>      use_common_alert_schema = bool<br>    }))</pre> | `[]` | no |
| <a name="input_automation_runbook_receiver"></a> [automation\_runbook\_receiver](#input\_automation\_runbook\_receiver) | List of objects with name, automation\_account\_id, runbook\_name, webhook\_resource\_id, is\_global\_runbook, service\_uri, use\_common\_alert\_schema | <pre>list(object({<br>      name                    = string<br>      automation_account_id   = string<br>      runbook_name            = string<br>      webhook_resource_id     = string<br>      is_global_runbook       = bool<br>      service_uri             = string<br>      use_common_alert_schema = bool<br>    }))</pre> | `[]` | no |
| <a name="input_azure_app_push_receiver"></a> [azure\_app\_push\_receiver](#input\_azure\_app\_push\_receiver) | List of objects with name and email\_address. | <pre>list(object({<br>      name          = string<br>      email_address = string<br>    }))</pre> | `[]` | no |
| <a name="input_azure_function_receiver"></a> [azure\_function\_receiver](#input\_azure\_function\_receiver) | List of objects with name and email\_address. | <pre>list(object({<br>      name                     = string<br>      function_app_resource_id = string<br>      function_name            = string<br>      http_trigger_url         = string<br>      use_common_alert_schema  = bool<br>    }))</pre> | `[]` | no |
| <a name="input_email_settings"></a> [email\_settings](#input\_email\_settings) | List of objects with name, email\_address and use\_common\_alert\_schema | <pre>list(object({<br>      name                    = string<br>      email_address           = string<br>      use_common_alert_schema = bool<br>    }))</pre> | `[]` | no |
| <a name="input_event_hub_receiver"></a> [event\_hub\_receiver](#input\_event\_hub\_receiver) | List of objects with name, event\_hub\_namespace, event\_hub\_name, subscription\_id and use\_common\_alert\_schema. | <pre>list(object({<br>      name                    = string<br>      event_hub_namespace     = string<br>      event_hub_name          = string<br>      subscription_id         = string<br>      use_common_alert_schema = bool<br>    }))</pre> | `[]` | no |
| <a name="input_itsm_receiver"></a> [itsm\_receiver](#input\_itsm\_receiver) | List of objects with name, workspace\_id, connection\_id, ticket\_configuration and region. | <pre>list(object({<br>      name                 = string<br>      workspace_id         = string<br>      connection_id        = string<br>      ticket_configuration = string<br>      region               = string<br>    }))</pre> | `[]` | no |
| <a name="input_logic_app_receiver"></a> [logic\_app\_receiver](#input\_logic\_app\_receiver) | List of objects with name, resource\_id, callback\_uri and use\_common\_alert\_schema. | <pre>list(object({<br>      name                    = string<br>      resource_id             = string<br>      callback_url            = string<br>      use_common_alert_schema = bool<br>    }))</pre> | `[]` | no |
| <a name="input_name"></a> [name](#input\_name) | Specifies the name of the Action group. Changing this forces a new resource to be created. | `string` | n/a | yes |
| <a name="input_resource_group_name"></a> [resource\_group\_name](#input\_resource\_group\_name) | Specifies the name of the Resource Group in which the Action group will exist. Changing this forces a new resource to be created. | `string` | n/a | yes |
| <a name="input_short_name"></a> [short\_name](#input\_short\_name) | Specifies the name of the Action group | `string` | n/a | yes |
| <a name="input_sms_receiver"></a> [sms\_receiver](#input\_sms\_receiver) | List of objects with name, country\_code and phone\_number. | <pre>list(object({<br>      name         = string<br>      country_code = number<br>      phone_number = number<br>    }))</pre> | `[]` | no |
| <a name="input_voice_receiver"></a> [voice\_receiver](#input\_voice\_receiver) | List of objects with name, country\_code and phone\_number. | <pre>list(object({<br>      name         = string<br>      country_code = number<br>      phone_number = number<br>    }))</pre> | `[]` | no |
| <a name="input_webhook_receiver"></a> [webhook\_receiver](#input\_webhook\_receiver) | List of objects with name, service\_uri and use\_common\_alert\_schema | <pre>list(object({<br>      name                    = string<br>      service_uri             = string<br>      use_common_alert_schema = bool<br>    }))</pre> | `[]` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_id"></a> [id](#output\_id) | The ID of the Action Group. |
<!-- END_TF_DOCS -->