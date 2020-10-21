module "cwe" {
  source      = "git::https://github.com/reflexivesecurity/reflex-engine.git//modules/cwe?ref=v2.1.2"
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
