variable "region" {
  type        = string
  default     = "eu-central-1"
  description = "The region to create the infrastructure"
}

variable "ami" {
  type        = string
  default     = "ami-00d5e377dd7fad751"
  description = "The ami to create the infrastructure"
}