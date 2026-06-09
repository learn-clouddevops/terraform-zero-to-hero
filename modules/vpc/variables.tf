variable "public_subnets" {
  type = map(object({
    cidr = string
    az   = string
  }))
}
variable "private_subnets" {
  type = map(object({
    cidr = string
    az   = string
  }))
}

variable "vpc_cidr" {

  type = string

}

variable "environment" {

  type = string

}

variable "project_name" {

  type = string

}