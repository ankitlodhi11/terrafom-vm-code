

rgs = {
  dev = {
    name     = "dev-rg"
    location = "East US"
  }
}
kvs = {
  dev = {
    kvs-name            = "dev-kv"
    value               = "MySecretValue"
    kvd_name            = "dev-kvs"
    resource_group_name = "dev-rg"
  }
}

kv = {
  dev = {
    name                        = "dev-kv"
    location                    = "East US"
    resource_group_name         = "dev-rg"
    enabled_for_disk_encryption = "true"
    # tenant_id                   = string
    soft_delete_retention_days  = 7
    purge_protection_enabled    = false
    sku_name                    = "standard"
  }
}


nics = {
  dev = {
    name            = "dev-nic"
    subnet_name         = "dev-subnet"
    vnet_name           = "dev-vnet"
    resource_group_name = "dev-rg"
    pipd_name           = "dev-pip"      
    location            = "East US"

     ip_configuration = [
      {
        ip_config_name = "dev-ipconfig"
        pip_alloc      = "Static"
      }
    ]
}}


vms = {
  dev = {
    nic_name            = "dev-nic"
    virtual_machine_name = "dev-vm"
    resource_group_name = "dev-rg"
    location            = "East US"
    size             = "Standard_DS1_v2"
    admin_username      = "azureadmin"
    admin_password      = "MyStrongPassword123!"
    pip_name            = "dev-pip"
    vnet_name           = "dev-vnet"
     subnet_name      = "dev-subnet"
     keyvault_name        = "dev-kv"
  }
}

vnet = {
  dev = {
    
    vnet_name           = "dev-vnet"
    resource_group_name = "dev-rg"
    location            = "East US"
    address_space       = [" 10.0.0.1/16"]

   
   subnets = {
      subnet01 = {
        subnet_name      = "dev-subnet"
        address_prefixes = ["10.0.1.0/24"]
      }

      subnet02 = {
        subnet_name      = "dev-app-subnet"
        address_prefixes = ["10.0.2.0/24"]
      }
    }
  
  }
}
public_ips = {
  dev = {
    pip_name            = "dev-pip"
    resource_group_name = "dev-rg"
    location            = "East US"
    allocation_method   = "Dynamic"
  }
}
nsg = {
  nsg = {
    name                = "dev-nsg"
    location            = "East US"
    resource_group_name = "dev-rg"
  }
}