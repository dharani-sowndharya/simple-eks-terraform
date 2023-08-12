variable "my_key_pair" {
  type    = string
  default = "dharani-eks-spark"
}

variable "my_ssh_sg_id" {
  type    = string
  default = "sg-0df4exxxxxx0dd1"
}

variable "my_public_ip" {
    type = string
    default = "49.xxxx.103/32"
}

variable "subnet_id_1" {
  type    = string
  default = "subnet-017bxxxxxx467a"
}

variable "subnet_id_2" {
  type    = string
  default = "subnet-0bc8xxxxx85c1"
}