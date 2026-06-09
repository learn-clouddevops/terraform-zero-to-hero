resource "aws_vpc" "vpc_main"{
    cidr_block = var.vpc_cidr
    enable_dns_support   = true

    enable_dns_hostnames = true

  tags = {

    Name        = "${var.environment}-${var.project_name}-vpc"

    Environment = var.environment

    Project     = var.project_name

    ManagedBy   = "Terraform"

  }
  }

  resource "aws_subnet" "public_subnet" {
    for_each = var.public_subnets
    vpc_id     = aws_vpc.vpc_main.id
    cidr_block = each.value.cidr
    availability_zone = each.value.az



  tags = {

    Name        = "${var.environment}-${var.project_name}-${each.key}"

    Environment = var.environment

    Project     = var.project_name

    Tier        = "public"

    ManagedBy   = "Terraform"

  }

  }
  resource "aws_subnet" "private_subnet" {

  for_each = var.private_subnets

  vpc_id            = aws_vpc.vpc_main.id

  cidr_block        = each.value.cidr

  availability_zone = each.value.az

  lifecycle {

    create_before_destroy = true

  }

  tags = {

    Name        = "${var.environment}-${var.project_name}-${each.key}"

    Environment = var.environment

    Project     = var.project_name

    Tier        = "private"

    ManagedBy   = "Terraform"

  }

}
  

  resource "aws_internet_gateway" "igw" {
    vpc_id = aws_vpc.vpc_main.id
    tags = {

      Name        = "${var.environment}-${var.project_name}-igw"

      Environment = var.environment

      Project     = var.project_name

      ManagedBy   = "Terraform"
  }

  }

#   resource "aws_route_table" "public" {

#   vpc_id = aws_vpc.vpc_main.id

#   tags = {

#     Name        = "${var.environment}-${var.project_name}-public-rt"

#     Environment = var.environment

#     Project     = var.project_name

#     Tier        = "public"

#     ManagedBy   = "Terraform"

#   }

# }

# resource "aws_route" "public_internet" {

#   route_table_id         = aws_route_table.public.id

#   destination_cidr_block = "0.0.0.0/0"

#   gateway_id             = aws_internet_gateway.main.id

# }

# resource "aws_route_table_association" "public" {

#   for_each = aws_subnet.public

#   subnet_id      = each.value.id

#   route_table_id = aws_route_table.public.id

# }

# resource "aws_route_table" "private" {

#   vpc_id = aws_vpc.vpc_main.id

#   tags = {

#     Name        = "${var.environment}-${var.project_name}-private-rt"

#     Environment = var.environment

#     Project     = var.project_name

#     Tier        = "private"

#     ManagedBy   = "Terraform"

#   }

# }

# resource "aws_route_table_association" "private" {

#   for_each = aws_subnet.private

#   subnet_id      = each.value.id

#   route_table_id = aws_route_table.private.id

# }
  