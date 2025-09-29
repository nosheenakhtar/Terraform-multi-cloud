output "vpc_id" { value = aws_vpc.this.id }
output "public_subnet_id" { value = aws_subnet.public.id }
output "instance_public_ip" { value = aws_instance.vm.public_ip }
