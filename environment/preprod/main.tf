

module "resource_group" {
    source = "../../modules/azurerm_resource_group"

    rgs=var.resource_grp
}

module "vnet"{
    depends_on = [ module.resource_group ]
    source = "../../modules/azurerm_virtual_network"

    vnets=var.virtual_net
}

module "sub_net"{
    depends_on = [ module.vnet ]
    source = "../../modules/azurerm_subnet"
    subnet=var.sub_nets
}

module "pip"{
    depends_on = [ module.resource_group]
    source = "../../modules/azurerm_public_ip"
    pip=var.public_ip
}


module "virtual_machine" {
    depends_on = [ module.pip,module.sub_net]
    source = "../../modules/azurerm_nic"
    vms=var.virtual_mac
  
}
