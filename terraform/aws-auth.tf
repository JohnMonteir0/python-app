module "eks" {
  source  = "git::ssh://git@github.com/JohnMonteir0/terraform-aws-eks.git//modules/aws-auth?ref=master"

  manage_aws_auth_configmap = true

  aws_auth_roles = [
    {
      rolearn  = "arn:aws:iam::${data.aws_caller_identity.current.account_id}:role/gh_actions_role"
      username = "gh_actions_role"
      groups   = ["system:masters"]
    },
  ]

  aws_auth_users = [
    {
      userarn  = "arn:aws:iam::${data.aws_caller_identity.current.account_id}:user/cloud_user"
      username = "cloud_user"
      groups   = ["system:masters"]
    }
  ]

  aws_auth_accounts = [
    "${data.aws_caller_identity.current.account_id}"
  ]

  depends_on = [
    module.eks_bottlerocket
  ]
}