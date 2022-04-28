#Global Tagging
owner = "alend"
env = "practice"

#Setup VPC
region = "us-east-1"
cidr_vpc = "10.0.0.0/16"

#Setup EKS
eks_cluster_name = "awn-simple-eks-project-eks"
eks_version = "1.22"
eks_node_name = "awn-simple-eks-project-eks-node-group"
eks_capacity_type = "ON_DEMAND"
eks_disk_size = "20"
eks_instance_type = "t3.small"
eks_desired_size = "1"
eks_max_size = "1"
eks_min_size = "1"
