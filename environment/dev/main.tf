module "rgs" {
  source = "../../modules/Resource_Group"
  rgs    = var.rgs
}
module "nsg" {
  source = "../../modules/network_security_group"
  nsg    = var.nsg
  depends_on = [module.rgs,module.public_ip,module.nic_association,module.vnet]
}
module "public_ip" {
  source     = "../../modules/Public_IP"
  public_ips = var.public_ips
}
module "nic_association" {
  source = "../../modules/nic_assication"
  nics   = var.nics
  depends_on = [module.vnet]
}
# module "kv_secret" {
#   source = "../../modules/Key_vault_secert"
#   kvs    = var.kvs
# }

module "vm" {
  source = "../../modules/Virtual_machine"
  vms    = var.vms
  depends_on = [module.rgs,module.nsg,module.public_ip,module.nic_association,module.vnet]
}
module "vnet" {
  source = "../../modules/Virtual_network"
  vnet   = var.vnet
  depends_on = [module.rgs]
}
