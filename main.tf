/**
* # Virtual Network Gateway module
*/

resource "azurerm_public_ip" "pip_gateway" {
  name                = "${var.name}-pip"
  resource_group_name = var.resource_group_name
  location            = var.location
  allocation_method   = var.public_ip_allocation_method
  sku                 = var.public_ip_sku

  lifecycle {
    ignore_changes = [tags]
  }
}

resource "azurerm_public_ip" "pip_active_active" {
  count = var.enable_active_active ? 1 : 0

  name                = "${var.name}-active-active-pip"
  location            = var.location
  resource_group_name = var.resource_group_name
  allocation_method   = var.public_ip_allocation_method
  sku                 = var.public_ip_sku

  lifecycle {
    ignore_changes = [tags]
  }
}

resource "azurerm_virtual_network_gateway" "vpn" {
  name                = var.name
  resource_group_name = var.resource_group_name
  location            = var.location
  type                = "Vpn"
  vpn_type            = var.vpn_type
  sku                 = var.vpn_gw_sku
  active_active       = var.vpn_gw_sku == "Basic" ? false : var.enable_active_active
  enable_bgp          = var.vpn_gw_sku == "Basic" ? false : var.enable_bgp
  generation          = var.vpn_gw_generation

  ip_configuration {
    name                          = "vnetGatewayConfig"
    public_ip_address_id          = azurerm_public_ip.pip_gateway.id
    private_ip_address_allocation = var.private_ip_address_allocation
    subnet_id                     = var.subnet_id
  }

  dynamic "ip_configuration" {
    for_each = var.enable_active_active ? [var.enable_active_active] : []

    content {
      name                          = "vnetGatewayAAConfig"
      public_ip_address_id          = azurerm_public_ip.pip_active_active[0].id
      private_ip_address_allocation = var.private_ip_address_allocation
      subnet_id                     = var.subnet_id
    }
  }

  dynamic "vpn_client_configuration" {
    for_each = var.vpn_client_configuration == null ? [] : [var.vpn_client_configuration]
    iterator = vpn

    content {
      address_space        = [vpn.value.address_space]
      vpn_client_protocols = vpn.value.vpn_client_protocols
      aad_tenant           = "https://login.microsoftonline.com/${vpn.value.aad_tenant}/"
      aad_audience         = var.aad_audience
      aad_issuer           = "https://sts.windows.net/${vpn.value.aad_tenant}/"
    }
  }

  lifecycle {
    ignore_changes = [tags]
  }
}