resource "aws_eks_cluster" "awn-simple-eks-project-eks" {
  name     = "awn-simple-eks-project-eks"
  version = "1.22"
  role_arn = aws_iam_role.eksClusterRoleCilistProject.arn

  vpc_config {
    subnet_ids = [
	  aws_subnet.awn-simple-eks-project-subnet-public-A.id, 
	  aws_subnet.awn-simple-eks-project-subnet-public-B.id,
	  aws_subnet.awn-simple-eks-project-subnet-public-C.id
	]
  }
  tags = {
    Name = "awn-simple-eks-project-eks"
  }
}

resource "aws_eks_addon" "awn-simple-eks-addon-vpc-cni-project-eks" {
  cluster_name = aws_eks_cluster.awn-simple-eks-project-eks.name
  addon_name   = "vpc-cni"
  resolve_conflicts = "OVERWRITE"
  addon_version = "v1.11.0-eksbuild.1"
  tags = {
    Name = "awn-simple-eks-addon-vpc-cni-project-eks"
  }
}
resource "aws_eks_addon" "awn-simple-eks-addon-coredns-project-eks" {
  cluster_name = aws_eks_cluster.awn-simple-eks-project-eks.name
  addon_name   = "coredns"
  resolve_conflicts = "OVERWRITE"
  addon_version = "v1.8.7-eksbuild.1"
  tags = {
    Name = "awn-simple-eks-addon-coredns-project-eks"
  }
}
resource "aws_eks_addon" "awn-simple-eks-addon-kube-proxy-project-eks" {
  cluster_name = aws_eks_cluster.awn-simple-eks-project-eks.name
  addon_name   = "kube-proxy"
  resolve_conflicts = "OVERWRITE"
  addon_version = "v1.22.6-eksbuild.1"
  tags = {
    Name = "awn-simple-eks-addon-kube-proxy-project-eks"
  }
}

#Node Group Configuration
resource "aws_eks_node_group" "awn-simple-eks-project-eks-node-group" {
  cluster_name    = aws_eks_cluster.awn-simple-eks-project-eks.name
  node_group_name = "awn-simple-eks-project-eks-node-group"
  capacity_type = "ON_DEMAND"
  disk_size = 20
  instance_types = ["t3.micro"]
  
  node_role_arn = aws_iam_role.eksClusterNodeGroupRoleCilistProject.arn
  subnet_ids = [
	  aws_subnet.awn-simple-eks-project-subnet-public-A.id, 
	  aws_subnet.awn-simple-eks-project-subnet-public-B.id,
	  aws_subnet.awn-simple-eks-project-subnet-public-C.id
	]

  scaling_config {
    desired_size = 1
    max_size     = 1
    min_size     = 1
  }

  update_config {
    max_unavailable = 1
  }
  tags = {
    Name = "awn-simple-eks-project-eks-node-group"
  }
}