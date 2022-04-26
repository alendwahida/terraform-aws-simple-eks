resource "aws_security_group" "all-in-awn-simple-eks-project-sg" {
  name        = "all-in-awn-simple-eks-project-sg"
  description = "Allow All inbound traffic"
  vpc_id      = aws_vpc.main.id

  ingress {
    description      = "From All Ip"
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
  }

  egress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
  }

  tags = {
    Name = "all-in-awn-simple-eks-project-sg"
  }
}