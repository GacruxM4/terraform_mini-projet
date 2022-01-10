resource "aws_instance" "my_ec2" {
  ami             = var.ami_name
  key_name        = var.key_name
  instance_type   = var.instance_type
  security_groups = [ "${var.sg_name}" ]
  tags = {
    Name = "${var.admin}-ec2-terraform"
    iac  = "terraform"
  }
  user_data = <<-EOF
              #!/bin/bash
              sudo apt-get update -y
              sudo apt-get -y install nginx
              sudo systemctl enable nginx
              sudo systemctl start nginx
              EOF
  provisioner "local-exec" {
  command = "echo '${self.tags.Name} [PUBLIC IP : ${self.public_ip} , ID: ${self.id} , AZ: ${self.availability_zone}]' >> infos-ec2.txt"
  }
}

resource "aws_volume_attachment" "ebs_att" {
  device_name = "/dev/sdh"
  volume_id   = var.volume_id_ebs_att
  instance_id = aws_instance.my_ec2.id
}

resource "aws_eip_association" "eip_assoc" {
  instance_id   = aws_instance.my_ec2.id
  allocation_id = var.eip_id_assoc
}

