data "aws_eks_cluster" "eks" {
    name = "dharani-cluster"
}

data "aws_eks_cluster_auth" "eks" {
  name = "dharani-cluster"
}

provider "kubernetes" {
  host                   = data.aws_eks_cluster.eks.endpoint
  cluster_ca_certificate = base64decode(data.aws_eks_cluster.eks.certificate_authority[0].data)
  token                  = data.aws_eks_cluster_auth.eks.token
} 



resource "kubernetes_config_map" "aws-auth" {
  data = {
    "mapRoles" = <<-EOT
          - groups:
            - system:bootstrappers
            - system:nodes
            rolearn: arn:aws:iam::0497xxxx181:role/eks-node-group-example
            username: system:node:{{EC2PrivateDNSName}}
            EOT
        
  }

  metadata {
    name      = "aws-auth"
    namespace = "kube-system"
  }
}