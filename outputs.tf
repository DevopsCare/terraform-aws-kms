/*
 * Copyright (C) 2020 DevOps, SIA. - All Rights Reserved
 * You may use, distribute and modify this code under the
 * terms of the Apache License Version 2.0.
 * http://www.apache.org/licenses
 */

output "this_kms_key_arn" {
  value = concat(aws_kms_key.this.*.arn, [""])[0]
}

output "this_kms_key_id" {
  value = concat(aws_kms_key.this.*.id, [""])[0]
}

output "this_kms_key_alias_arn" {
  value = concat(aws_kms_alias.this.*.arn, [""])[0]
}

output "this_kms_key_alias_name" {
  value = concat(aws_kms_alias.this.*.id, [""])[0]
}
