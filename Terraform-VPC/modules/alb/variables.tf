variable "sg_id" {
    description = "sg id for alb"
    type = string
  
}

variable "subnets" {
    description = "subnets for alb"
    type = list(string)
  
}

variable "vpc_id" {
    description = "VPC ID for ALB"
    type = string
  
}

variable "instances" {
    description = "instance id for target group attachments"
    type = list(string)
  
}