module "reflex_aws_role_permissions_boundary_changed_or_deleted" {
  source           = "git::https://github.com/cloudmitigator/reflex-engine.git//modules/cwe_lambda?ref=v0.5.4"
  rule_name        = "RolePermissionsBoundaryChangedOrDeleted"
  rule_description = "Rule for detecting the modification or deletion of IAM Role permission boundary."

  event_pattern = <<PATTERN
{
  "source": [
    "aws.iam"
  ],
  "detail-type": [
    "AWS API Call via CloudTrail"
  ],
  "detail": {
    "eventSource": [
      "iam.amazonaws.com"
    ],
    "eventName": [
      "PutRolePermissionsBoundary",
      "DeleteRolePermissionsBoundary"
    ]
  }
}
PATTERN

  function_name   = "RolePermissionsBoundaryChangedOrDeleted"
  source_code_dir = "${path.module}/source"
  handler         = "reflex_aws_role_permissions_boundary_changed_or_deleted.lambda_handler"
  lambda_runtime  = "python3.7"
  environment_variable_map = {
    SNS_TOPIC = var.sns_topic_arn,
    
  }

  queue_name    = "RolePermissionsBoundaryChangedOrDeleted"
  delay_seconds = 0

  target_id = "RolePermissionsBoundaryChangedOrDeleted"

  sns_topic_arn  = var.sns_topic_arn
  sqs_kms_key_id = var.reflex_kms_key_id
}
