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