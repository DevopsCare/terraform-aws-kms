/*
 * Copyright (C) 2020 DevOps, SIA. - All Rights Reserved
 * You may use, distribute and modify this code under the
 * terms of the Apache License Version 2.0.
 * http://www.apache.org/licenses
 */

module "label" {
  source      = "git::https://github.com/cloudposse/terraform-null-label.git?ref=tags/0.19.0"
  namespace   = var.namespace
  name        = var.name
  stage       = var.stage
  environment = var.environment
  delimiter   = var.delimiter
  attributes  = var.attributes
  tags        = var.tags
  enabled     = var.enabled
}

resource "aws_kms_key" "this" {
  count                    = var.enabled == true ? 1 : 0
  deletion_window_in_days  = var.deletion_window_in_days
  key_usage                = var.key_usage
  customer_master_key_spec = var.customer_master_key_spec
  enable_key_rotation      = var.enable_key_rotation
  policy                   = var.policy
  description              = var.description
  tags                     = module.label.tags
}

resource "aws_kms_alias" "this" {
  count         = var.enabled == true ? 1 : 0
  name          = coalesce(var.alias, format("alias/%v", module.label.id))
  target_key_id = join("", aws_kms_key.this.*.id)
}
