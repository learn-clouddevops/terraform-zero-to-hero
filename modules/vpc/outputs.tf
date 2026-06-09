output "aws_vpc_id" {
    value = aws_vpc.vpc_main.id
}

output "aws_public_subnet_ids" {
    value = [for subnet in aws_subnet.public_subnet : subnet.id]
}

output "aws_private_subnet_ids" {
    value = [for subnet in aws_subnet.private_subnet : subnet.id]
}