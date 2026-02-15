variable "volume_tag" {
  description = "Tag value used to select volumes for backups"
  type        = string
  default     = "jenkins"
}

resource "aws_dlm_lifecycle_policy" "jenkins_ebs_backup" {
  description        = "Daily snapshot for Jenkins EBS"
  execution_role_arn = var.iam_role_arn
  state              = "ENABLED"

  policy_details {
    resource_types = ["VOLUME"]

    target_tags = {
      Backup = var.volume_tag
    }

    schedule {
      name = "daily-backup"

      create_rule {
        interval      = 24
        interval_unit = "HOURS"
        times         = ["00:00"]
      }

      retain_rule {
        count = 7
      }

      tags_to_add = {
        Snapshot = "jenkins"
      }
    }
  }
}
