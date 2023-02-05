variable "resource_group_name" {
  description = "(Required)A container that holds related resources for an Azure solution."
  type        = string
}

variable "location" {
  description = "(Required)The location to keep all your network resources. To get the list of all locations with table format from azure cli, run 'az account list-locations -o table'."
  type        = string
}

variable "name" {
  description = "(Required)The name of the Virtual Network Gateway."
  type        = string
}

variable "subnet_id" {
  description = "(Required)VPN gateway id."
  type        = string
}

variable "vpn_client_configuration" {
  description = "(Optional)Virtual Network Gateway client configuration to accept IPSec point-to-site connections."
  type = object({
    address_space        = string,
    vpn_client_protocols = list(string),
    aad_tenant           = string
  })
  default = null
}

variable "public_ip_allocation_method" {
  description = "(Optional)Defines the allocation method for this IP address. Possible values are Static or Dynamic. Defaults to Dynamic."
  type        = string
  default     = "Dynamic"
}

variable "vpn_type" {
  description = "(Optional)The routing type of the Virtual Network Gateway. Valid options are RouteBased or PolicyBased. Defaults to RouteBased."
  type        = string
  default     = "RouteBased"
}

variable "vpn_gw_sku" {
  description = "(Optional)Configuration of the size and capacity of the virtual network gateway. Valid options are Basic, VpnGw1, VpnGw2, VpnGw3, VpnGw4, VpnGw5, VpnGw1AZ, VpnGw2AZ, VpnGw3AZ, VpnGw4AZ and VpnGw5AZ and depend on the type, vpn_type and generation arguments."
  type        = string
  default     = "VpnGw2"

  validation {
    condition     = contains(["Basic", "VpnGw1", "VpnGw2", "VpnGw3", "VpnGw4", "VpnGw5", "VpnGw1AZ", "VpnGw2AZ", "VpnGw3AZ", "VpnGw4AZ", "VpnGw5AZ"], var.vpn_gw_sku)
    error_message = "Valid options are Basic, VpnGw1, VpnGw2, VpnGw3, VpnGw4, VpnGw5, VpnGw1AZ, VpnGw2AZ, VpnGw3AZ, VpnGw4AZ and VpnGw5AZ."
  }
}

variable "public_ip_sku" {
  description = "(Optional)The SKU of the Public IP. Accepted values are Basic and Standard. Defaults to Basic."
  type        = string
  default     = "Basic"
}

variable "vpn_gw_generation" {
  description = "(Optional)The Generation of the Virtual Network gateway. Possible values include Generation1, Generation2 or None."
  type        = string
  default     = "Generation1"
}

variable "enable_active_active" {
  description = "(Optional)If true, an active-active Virtual Network Gateway will be created. An active-active gateway requires a HighPerformance or an UltraPerformance sku. If false, an active-standby gateway will be created. Defaults to false."
  type        = string
  default     = false
}

variable "enable_bgp" {
  description = "(Optional)If true, BGP (Border Gateway Protocol) will be enabled for this Virtual Network Gateway. Defaults to false."
  type        = string
  default     = false
}

variable "private_ip_address_allocation" {
  description = "(Optional)Private ip_address allocation."
  type        = string
  default     = "Dynamic"
}

variable "aad_audience" {
  description = "(Optional)The client id of the Azure VPN application. See Create an Active Directory (AD) tenant for P2S OpenVPN protocol connections for values."
  type        = string
  default     = null
}