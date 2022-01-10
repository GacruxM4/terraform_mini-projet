module "sg_app" {
  source = "../modules/security_group"
  admin = "daix"
}

module "ebs_app" {
  source = "../modules/ebs"  
  admin = "daix"
  availability_ebs_zone = "us-east-1b"
  size_ebs = 4
}

module "ip_app" {
  source = "../modules/ip_public"  
}


module "ec2_app" {
  source = "../modules/ec2"
  sg_name = module.sg_app.sg_name_out
  admin = "daix"
  ami_name = data.aws_ami.my-ami.id
  instance_type = "t2.nano"
  key_name = "daix-kp-ajc"
  volume_id_ebs_att = module.ebs_app.ebs_id_out
  eip_id_assoc = module.ip_app.eip_id_out
}