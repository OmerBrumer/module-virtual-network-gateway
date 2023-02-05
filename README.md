<!-- BEGIN_TF_DOCS -->

# Virtual Network Gateway module

## Examples
```hcl
module "vpn_gateway" {
  source = "./modules/network/vpn_gateway"

  name                 = "brumer-final-terraform-hub-vnet-gateway"
  resource_group_name  = "brumer-final-terraform-hub-rg"
  location             = "West Europe"
  subnet_id            = "/subscriptions/d94fe338-52d8-4a44-acd4-4f8301adf2cf/resourceGroups/brumer-final-terraform-hub-rg/providers/Microsoft.Network/virtualNetworks/brumer-final-terraform-hub-vnet/subnets/GatewaySubnet"
  enable_active_active = true

  vpn_client_configuration = {
    address_space        = "10.11.0.0/24"
    vpn_client_protocols = ["OpenVPN"]
    aad_tenant           = "c9ad96a7-2bac-49a7-abf6-8e932f60bf2b"
  }
}
```

#### Providers

| Name | Version |
|------|---------|
| <a name="provider_azurerm"></a> [azurerm](#provider\_azurerm) | n/a |

#### Outputs

| Name | Description |
|------|-------------|
| <a name="output_id"></a> [id](#output\_id) | Id of vpn gateway. |
| <a name="output_name"></a> [name](#output\_name) | Name of vpn gateway. |
| <a name="output_object"></a> [object](#output\_object) | Object of vpn gateway. |

#### Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_location"></a> [location](#input\_location) | (Required)The location to keep all your network resources. To get the list of all locations with table format from azure cli, run 'az account list-locations -o table'. | `string` | n/a | yes |
| <a name="input_name"></a> [name](#input\_name) | (Required)The name of the Virtual Network Gateway. | `string` | n/a | yes |
| <a name="input_resource_group_name"></a> [resource\_group\_name](#input\_resource\_group\_name) | (Required)A container that holds related resources for an Azure solution. | `string` | n/a | yes |
| <a name="input_subnet_id"></a> [subnet\_id](#input\_subnet\_id) | (Required)VPN gateway id. | `string` | n/a | yes |
| <a name="input_enable_active_active"></a> [enable\_active\_active](#input\_enable\_active\_active) | (Optional)If true, an active-active Virtual Network Gateway will be created. An active-active gateway requires a HighPerformance or an UltraPerformance sku. If false, an active-standby gateway will be created. Defaults to false. | `string` | `false` | no |
| <a name="input_enable_bgp"></a> [enable\_bgp](#input\_enable\_bgp) | (Optional)If true, BGP (Border Gateway Protocol) will be enabled for this Virtual Network Gateway. Defaults to false. | `string` | `false` | no |
| <a name="input_private_ip_address_allocation"></a> [private\_ip\_address\_allocation](#input\_private\_ip\_address\_allocation) | (Optional)Private ip\_address allocation. | `string` | `"Dynamic"` | no |
| <a name="input_public_ip_allocation_method"></a> [public\_ip\_allocation\_method](#input\_public\_ip\_allocation\_method) | (Optional)Defines the allocation method for this IP address. Possible values are Static or Dynamic. Defaults to Dynamic. | `string` | `"Dynamic"` | no |
| <a name="input_public_ip_sku"></a> [public\_ip\_sku](#input\_public\_ip\_sku) | (Optional)The SKU of the Public IP. Accepted values are Basic and Standard. Defaults to Basic. | `string` | `"Basic"` | no |
| <a name="input_vpn_client_configuration"></a> [vpn\_client\_configuration](#input\_vpn\_client\_configuration) | (Optional)Virtual Network Gateway client configuration to accept IPSec point-to-site connections. | <pre>object({<br>    address_space        = string,<br>    vpn_client_protocols = list(string),<br>    aad_tenant           = string<br>  })</pre> | `null` | no |
| <a name="input_vpn_gw_generation"></a> [vpn\_gw\_generation](#input\_vpn\_gw\_generation) | (Optional)The Generation of the Virtual Network gateway. Possible values include Generation1, Generation2 or None. | `string` | `"Generation1"` | no |
| <a name="input_vpn_gw_sku"></a> [vpn\_gw\_sku](#input\_vpn\_gw\_sku) | (Optional)Configuration of the size and capacity of the virtual network gateway. Valid options are Basic, VpnGw1, VpnGw2, VpnGw3, VpnGw4, VpnGw5, VpnGw1AZ, VpnGw2AZ, VpnGw3AZ, VpnGw4AZ and VpnGw5AZ and depend on the type, vpn\_type and generation arguments. | `string` | `"VpnGw2"` | no |
| <a name="input_vpn_type"></a> [vpn\_type](#input\_vpn\_type) | (Optional)The routing type of the Virtual Network Gateway. Valid options are RouteBased or PolicyBased. Defaults to RouteBased. | `string` | `"RouteBased"` | no |



# Authors
Originally created by Omer Brumer
<!-- END_TF_DOCS -->