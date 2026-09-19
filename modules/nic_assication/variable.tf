variable "nics" {
  type = map(object({
    name            = string
    location            = string
    resource_group_name = string
    subnet_name         = string
    vnet_name           = string
    pipd_name           = string
    ip_configuration = list(object({
      ip_config_name = string
      pip_alloc      = string
    }))
  }))

}