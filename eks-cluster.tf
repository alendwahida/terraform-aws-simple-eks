resource "aws_eks_cluster" "awn-simple-eks-project-eks" {
  name     = var.eks_cluster_name
  version = var.eks_version
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
  node_group_name = var.eks_node_name
  capacity_type = var.eks_capacity_type
  disk_size = var.eks_disk_size
  instance_types = [var.eks_instance_type]
  
  node_role_arn = aws_iam_role.eksClusterNodeGroupRoleCilistProject.arn
  subnet_ids = [
	  aws_subnet.awn-simple-eks-project-subnet-public-A.id, 
	  aws_subnet.awn-simple-eks-project-subnet-public-B.id,
	  aws_subnet.awn-simple-eks-project-subnet-public-C.id
	]

  scaling_config {
    desired_size = var.eks_desired_size
    max_size     = var.eks_max_size
    min_size     = var.eks_min_size
  }

  update_config {
    max_unavailable = 1
  }
  tags = {
    Name = "awn-simple-eks-project-eks-node-group"
  }
}