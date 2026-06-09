
vpc_cidr = "10.10.0.0/16"
aws_region = "ap-south-1"
environment = "dev"
project_name = "eks-platform"
cluster_name = "vpc"
public_subnets = {
  public-a = {
    cidr = "10.10.1.0/24"
    az   = "ap-south-1a"
  }

  public-b = {
    cidr = "10.10.2.0/24"
    az   = "ap-south-1b"
  }
}

private_subnets = {
  private-a = {
    cidr = "10.10.3.0/24"
    az   = "ap-south-1a"
  }

  private-b = {
    cidr = "10.10.4.0/24"
    az   = "ap-south-1b"
  }
}