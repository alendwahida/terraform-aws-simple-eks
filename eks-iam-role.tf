resource "aws_iam_role" "eksClusterRoleCilistProject" {
  name = "eksClusterRoleCilistProject"
  assume_role_policy    = jsonencode({
    Version   = "2012-10-17"
    Statement = [
      {
        Action    = "sts:AssumeRole"
        Effect    = "Allow"
        Principal = {
          Service = "eks.amazonaws.com"
        }
      },
    ]
  })
  description           = "EKS Cluster Role"
  force_detach_policies = false
  max_session_duration  = 3600
  managed_policy_arns   = [
      "arn:aws:iam::aws:policy/AmazonEKSClusterPolicy",
  ]
  tags = {
    Name = "eksClusterRoleCilistProject"
  }
}

resource "aws_iam_role" "eksClusterNodeGroupRoleCilistProject" {
  name = "eksClusterNodeGroupRoleCilistProject"
  assume_role_policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Action = "sts:AssumeRole"
        Effect = "Allow"
        Principal = {
          Service = "ec2.amazonaws.com"
        }
      },
    ]
  })
  description           = "EKS Node Group Role"
  force_detach_policies = false
  max_session_duration  = 3600
  tags = {
    Name = "eksClusterNodeGroupRoleCilistProject"
  }
}

resource "aws_iam_role_policy_attachment" "awn-simple-eks-AmazonEKSWorkerNodePolicy" {
  policy_arn = "arn:aws:iam::aws:policy/AmazonEKSWorkerNodePolicy"
  role       = aws_iam_role.eksClusterNodeGroupRoleCilistProject.name
}

resource "aws_iam_role_policy_attachment" "awn-simple-eks-AmazonEKS_CNI_Policy" {
  policy_arn = "arn:aws:iam::aws:policy/AmazonEKS_CNI_Policy"
  role       = aws_iam_role.eksClusterNodeGroupRoleCilistProject.name
}

resource "aws_iam_role_policy_attachment" "awn-simple-eks-AmazonEC2ContainerRegistryReadOnly" {
  policy_arn = "arn:aws:iam::aws:policy/AmazonEC2ContainerRegistryReadOnly"
  role       = aws_iam_role.eksClusterNodeGroupRoleCilistProject.name
}
