output "eks_cluster_sg_id" { 
    value = aws_eks_cluster.dharani-eks.vpc_config
}

output "eks_node_sg_id" {
    value = aws_eks_node_group.worker-node-group.resources
}