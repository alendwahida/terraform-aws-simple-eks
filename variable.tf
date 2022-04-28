#Global Tag
variable "owner" {}
variable "env" {}

#Setup EKS
variable "eks_cluster_name" {}
variable "eks_version" {}
variable "eks_node_name" {}
variable "eks_capacity_type" {}
variable "eks_disk_size" {}
variable "eks_instance_type" {}
variable "eks_desired_size" {}
variable "eks_max_size" {}
variable "eks_min_size" {}