module "eks" {
  source  = "terraform-aws-modules/eks/aws"
  version = "~> 20.0" # 최신 v20 버전 사용

  cluster_name    = "gwanak-ml-cluster"
  cluster_version = "1.31" # 최신 쿠버네티스 버전

  vpc_id     = module.vpc.vpc_id
  subnet_ids = module.vpc.private_subnets
  
  # 클러스터 엔드포인트 설정 (v20 방식)
  cluster_endpoint_public_access = true

  # EKS Addons 설정 (에러가 났던 부분 해결)
  cluster_addons = {
    coredns = {
      resolve_conflicts_on_create = "OVERWRITE"
    }
    kube-proxy = {}
    vpc-cni    = {}
  }

  # 관리형 노드 그룹 설정 (v20 방식)
  eks_managed_node_groups = {
    gwanak_node = {
      ami_type       = "AL2_x86_64"
      instance_types = ["t3.medium"]

      min_size     = 2
      max_size     = 5
      desired_size = 2
    }
  }

  # 보안 그룹 및 접근 제어 (v20 필수 설정)
  enable_cluster_creator_admin_permissions = true
}