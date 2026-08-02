rgs = {
  rg1 = {
    name     = "rg-saurav1"
    location = "West Europe"
  }
  rg2 = {
    name     = "rg-saurav2"
    location = "West Europe"
  }
  rg3 = {
    name     = "rg-saurav3"
    location = "West Europe"
  }
}
vnets = {
  vnet1 = {
    name                = "vnet-saurav1"
    location            = "West Europe"
    resource_group_name = "rg-saurav1"
    address_space       = ["10.0.0.0/16"]
  }
  vnet2 = {
    name                = "vnet-saurav2"
    location            = "West Europe"
    resource_group_name = "rg-saurav2"
    address_space       = ["10.1.0.0/16"]
  }
  vnet3 = {
    name                = "vnet-saurav3"
    location            = "West Europe"
    resource_group_name = "rg-saurav3"
    address_space       = ["10.2.0.0/16"]
  }
}
snets = {
  subnet1 = {
    name                 = "subnet-saurav1"
    resource_group_name  = "rg-saurav1"
    virtual_network_name = "vnet-saurav1"
    address_prefixes     = ["10.0.1.0/24"]
  }
  subnet2 = {
    name                 = "subnet-saurav2"
    resource_group_name  = "rg-saurav1"
    virtual_network_name = "vnet-saurav1"
    address_prefixes     = ["10.0.2.0/24"]
  }
  subnet3 = {
    name                 = "subnet-saurav3"
    resource_group_name  = "rg-saurav1"
    virtual_network_name = "vnet-saurav1"
    address_prefixes     = ["10.0.3.0/24"]
  }
  subnet4 = {
    name                 = "subnet-saurav4"
    resource_group_name  = "rg-saurav2"
    virtual_network_name = "vnet-saurav2"
    address_prefixes     = ["10.1.1.0/24"]
  }
  subnet5 = {
    name                 = "subnet-saurav5"
    resource_group_name  = "rg-saurav2"
    virtual_network_name = "vnet-saurav2"
    address_prefixes     = ["10.1.2.0/24"]
  }
}
pips = {
  pip1 = {
    name                = "pip-saurav1"
    resource_group_name = "rg-saurav1"
    location            = "West Europe"
    allocation_method   = "Static"
  }
}
nics = {
  nic1 = {
    name                = "nic-saurav1"
    resource_group_name = "rg-saurav1"
    location            = "West Europe"
    ip_configuration = {
      name                          = "internal"
      subnet_name                   = "subnet-saurav1"
      virtual_network_name          = "vnet-saurav1"
      private_ip_address_allocation = "Dynamic"
      public_ip_name                = "pip-saurav1"
    }

  }
}
vms = {
  vm1 = {
    name                = "vm-saurav1"
    resource_group_name = "rg-saurav1"
    location            = "West Europe"
    network_interface_name = "nic-saurav1"
    os_profile = {
      computer_name  = "hostname"
      admin_username = "testadmin"
      admin_password = "Str0ngP@ssw0rd!2026"
    }
  }
}