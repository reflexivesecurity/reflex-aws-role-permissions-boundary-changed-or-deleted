module "cwe" {
  source      = "git::https://github.com/cloudmitigator/reflex-engine.git//modules/cwe?ref=v1.0.0"
  name        = "RolePermissionsBoundaryChangedOrDeleted"
  description = "Rule for detecting the modification or deletion of IAM Role permission boundary."

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

}
