resource "aws_eip" "my_eip" {
  vpc      = true
}
output "eip_id_out" {
    value = aws_eip.my_eip.id
}