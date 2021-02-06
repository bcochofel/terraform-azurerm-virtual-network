variable "resource_group_name" {
  description = <<EOT
The name of the resource group in which to create the virtual network.
The Resource Group must already exist.
EOT
  type        = string
}

variable "enable_ddos_plan" {
  description = <<EOT
Whether or not to enable DDoS protection plan.
DDoS can be enabled by creating a new plan or use one that already exists.
If ddos_plan_id is not empty, it will be used otherwise ddos_plan_name will be
used to create a new plan.
EOT
  type        = bool
  default     = false
}

variable "ddos_plan_name" {
  description = <<EOT
DDos protection plan name to create a new plan.
EOT
  type        = string
  default     = ""
}

variable "ddos_plan_id" {
  description = <<EOT
DDoS protection plan ID to use one already created.
EOT
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
}

variable "address_space" {
  description = <<EOT
The address space that is used the virtual network.
You can supply more than one address space.
EOT
  type        = list(string)
}

variable "dns-servers" {
  description = "List of IP addresses of DNS servers."
  type        = list(string)
  default     = []
}

variable "bgp_community" {
  description = "The BGP community attribute in format <as-number>:<community-value>."
  type        = string
  default     = ""
}

variable "vm_protection_enabled" {
  description = "Whether to enable VM protection for all the subnets in this Virtual Network."
  type        = bool
  default     = false
}
