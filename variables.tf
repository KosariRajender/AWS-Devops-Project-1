variable "region" {
  type        = string
  description = "aws region of my account"
  default     = "us-east-1"
}
variable "environment" {
  type        = string
  description = "environment my account"
  default     = "testing"
}
variable "account_env" {
  type        = string
  description = "account_env of my account"
  default     = "test"
}
variable "account_id" {
  type        = number
  description = "mumber of my account"
  default     = "010438510808"
}
variable "allowed_ports" {
  description = "Map of allowed ports and their descriptions for ingress"
  type = map(object({
    from_port   = number
    to_port     = number
    protocol    = string
    cidr_blocks = list(string)
  }))
  default = {
    ssh = {
      from_port   = 22
      to_port     = 22
      protocol    = "tcp"
      cidr_blocks = ["0.0.0.0/0"]
    }
    http = {
      from_port   = 80
      to_port     = 80
      protocol    = "tcp"
      cidr_blocks = ["0.0.0.0/0"]
    }
  }
}

variable "allowed_egress_ports" {
  description = "Map of allowed ports and their descriptions for egress"
  type = map(object({
    from_port   = number
    to_port     = number
    protocol    = string
    cidr_blocks = list(string)
  }))
  default = {
    all_outbound = {
      from_port   = 0
      to_port     = 0
      protocol    = "-1"
      cidr_blocks = ["0.0.0.0/0"]
    }
  }
}
