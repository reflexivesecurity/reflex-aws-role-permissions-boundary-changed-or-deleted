variable "sns_topic_arn" { 
  description = "SNS topic arn of central or local sns topic"
  type        = string
}

variable "reflex_kms_key_id" {
  description = "KMS Key Id for common reflex usage."
  type        = string
}

variable "cloudwatch_event_rule_id" {
  description = "Easy name of CWE"
  type        = string
}

variable "cloudwatch_event_rule_arn" {
  description = "Full arn of CWE"
  type        = string
}

variable "package_location" {
  description = "Path for the Lambda deployment package"
  type        = string
  default     = "../package_build/role-permissions-boundary-changed-or-deleted.zip"
}
