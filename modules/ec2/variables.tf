variable "instance_type" {
  default = "t2.micro"
}

variable "ami_name" {
  default = "ami-04505e74c0741db8d"
}

variable "key_name" {
  default = ""
}

variable "sg_name" {
  default = "terraform-test-sg"
}

variable "volume_id_ebs_att" {
  default = ""  
}

variable "eip_id_assoc" {
  default = ""  
}

variable "admin" {
  default = "daix"
}