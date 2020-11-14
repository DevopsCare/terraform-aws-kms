/*
 * Copyright (C) 2020 DevOps, SIA. - All Rights Reserved
 * You may use, distribute and modify this code under the
 * terms of the Apache License Version 2.0.
 * http://www.apache.org/licenses
 */

module "label" {
  source  = "cloudposse/label/null"
  version = "0.21.0"

  enabled             = var.enabled
  namespace           = var.namespace
  environment         = var.environment
  stage               = var.stage
  name                = var.name
  delimiter           = var.delimiter
  attributes          = var.attributes
  tags                = var.tags
  additional_tag_map  = var.additional_tag_map
  label_order         = var.label_order
  regex_replace_chars = var.regex_replace_chars
  id_length_limit     = var.id_length_limit

  context = var.context
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
