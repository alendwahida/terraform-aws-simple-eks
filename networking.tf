resource "aws_vpc" "main" {
   cidr_block = var.cidr_vpc
   tags = {
     Name = "awn-simple-eks-project-vpc"
   }
}

resource "aws_internet_gateway" "awn-simple-eks-project-igw" {
  vpc_id = aws_vpc.main.id
  tags = {
     Name = "awn-simple-eks-project-igw"
  }
}

resource "aws_subnet" "awn-simple-eks-project-subnet-public-A" {
  vpc_id = aws_vpc.main.id
  availability_zone = "us-east-1a"
  cidr_block = "10.0.0.0/22"
  map_public_ip_on_launch = true
  enable_resource_name_dns_a_record_on_launch = true
  tags = {
    Name = "awn-simple-eks-project-subnet-public-A"
  }
}
resource "aws_subnet" "awn-simple-eks-project-subnet-public-B" {
  vpc_id = aws_vpc.main.id
  availability_zone = "us-east-1b"
  cidr_block = "10.0.4.0/22"
  map_public_ip_on_launch = true
  enable_resource_name_dns_a_record_on_launch = true
  tags = {
    Name = "awn-simple-eks-project-subnet-public-B"
  }
}
resource "aws_subnet" "awn-simple-eks-project-subnet-public-C" {
  vpc_id = aws_vpc.main.id
  availability_zone = "us-east-1c"
  cidr_block = "10.0.8.0/22"
  map_public_ip_on_launch = true
  enable_resource_name_dns_a_record_on_launch = true
  tags = {
    Name = "awn-simple-eks-project-subnet-public-C"
  }
}

resource "aws_route_table" "awn-simple-eks-project-rtb-public" {
  vpc_id = aws_vpc.main.id
  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.awn-simple-eks-project-igw.id
  }
  tags = {
    Name = "awn-simple-eks-project-rtb-public"
  }
}

resource "aws_route_table_association" "awn-simple-eks-project-rtb-assoc-public-A" {
  subnet_id = aws_subnet.awn-simple-eks-project-subnet-public-A.id
  route_table_id = aws_route_table.awn-simple-eks-project-rtb-public.id
}
resource "aws_route_table_association" "awn-simple-eks-project-rtb-assoc-public-B" {
  subnet_id = aws_subnet.awn-simple-eks-project-subnet-public-B.id
  route_table_id = aws_route_table.awn-simple-eks-project-rtb-public.id
}
resource "aws_route_table_association" "awn-simple-eks-project-rtb-assoc-public-C" {
  subnet_id = aws_subnet.awn-simple-eks-project-subnet-public-C.id
  route_table_id = aws_route_table.awn-simple-eks-project-rtb-public.id
}