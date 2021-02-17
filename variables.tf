variable "resource_group_name" {
  description = <<EOT
The name of the resource group in which to create the virtual network.
The Resource Group must already exist.
EOT
  type        = string
}

variable "enable_ddos_pp" {
  description = <<EOT
Whether or not to enable DDoS protection plan.
DDoS can be enabled by creating a new plan or use one that already exists.
EOT
  type        = bool
  default     = false
}

variable "create_ddos_pp" {
  description = "Whether or not to create DDoS protection plan."
  type        = bool
  default     = false
}

variable "ddos_pp_name" {
  description = <<EOT
DDos protection plan name of an existing plan or to create a new one.
If create_ddos_pp is false and enable_ddos_pp is true this variable
must reference a DDoS protection plan already created and
ddos_pp_resource_group_name must also be defined.
EOT
  type        = string
  default     = ""
}

variable "ddos_pp_resource_group_name" {
  description = "Resource Group name if using existing DDoS protection plan."
  type        = string
  default     = ""
}

variable "tags" {
  description = "A mapping of tags which should be assigned to Resources."
  type        = map(string)
  default     = {}
}

variable "name" {
  description = <<EOT
The name of the virtual network.
Changing this forces a new resource to be created.
EOT
  type        = string

  validation {
    condition     = length(var.name) >= 2 && length(var.name) <= 64 && can(regex("^[a-zA-Z0-9][a-zA-Z0-9-._]+[a-zA-Z0-9_]$", var.name))
    error_message = "Invalid name (check Azure Resource naming restrictions for more info)."
  }
}

variable "address_space" {
  description = <<EOT
The address space that is used the virtual network.
You can supply more than one address space.
EOT
  type        = list(string)
}

variable "dns_servers" {
  description = "List of IP addresses of DNS servers."
  type        = list(string)
  default     = []
}

variable "vm_protection_enabled" {
  description = "Whether to enable VM protection for all the subnets in this Virtual Network."
  type        = bool
  default     = false
}
