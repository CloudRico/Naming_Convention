 variable "resource_type" {
    default = ""
}
variable "enviroment" {
    description = "Enviroment in which you're deplying into"
    default     = "dev"
}

variable "workload" {
    description = "Kind of work load you're working with"
}

variable "application"{}
variable "instance"{}

