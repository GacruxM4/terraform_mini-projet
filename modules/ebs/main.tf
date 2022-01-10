resource "aws_ebs_volume" "my_ebs" {
  availability_zone = var.availability_ebs_zone
  size = var.size_ebs

  tags = {
    Name = "${var.admin}-ebs"
  }
}
output "ebs_id_out" {
    value = aws_ebs_volume.my_ebs.id
}