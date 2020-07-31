## Requirements

No requirements.

## Providers

| Name | Version |
|------|---------|
| aws | n/a |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| alias | The display name of the alias. The name must start with the word `alias` followed by a forward slash | `string` | `""` | no |
| attributes | Additional attributes (e.g. `1`) | `list(string)` | `[]` | no |
| customer\_master\_key\_spec | Specifies whether the key contains a symmetric key or an asymmetric key pair and the encryption algorithms or signing algorithms that the key supports. Valid values: SYMMETRIC\_DEFAULT, RSA\_2048, RSA\_3072, RSA\_4096, ECC\_NIST\_P256, ECC\_NIST\_P384, ECC\_NIST\_P521, or ECC\_SECG\_P256K1. | `string` | `"RSA_4096"` | no |
| deletion\_window\_in\_days | Duration in days after which the key is deleted after destruction of the resource | `number` | `10` | no |
| delimiter | Delimiter to be used between `namespace`, `stage`, `name` and `attributes` | `string` | `"-"` | no |
| description | The description of the key as viewed in AWS console | `string` | `"KMS key"` | no |
| enable\_key\_rotation | Specifies whether key rotation is enabled | `bool` | `true` | no |
| enabled | Set to false to prevent the module from creating any resources | `bool` | `true` | no |
| environment | Environment, e.g. 'prod', 'staging', 'dev', 'pre-prod', 'UAT' | `string` | `""` | no |
| key\_usage | Key usage type. Can be ENCRYPT\_DECRYPT or SIGN\_VERIFY | `string` | `"SIGN_VERIFY"` | no |
| name | Name  (e.g. `app` or `cluster`) | `string` | n/a | yes |
| namespace | Namespace (e.g. `pb` or `paybis`) | `string` | `""` | no |
| policy | A valid KMS policy JSON document. Note that if the policy document is not specific enough (but still valid), Terraform may view the policy as constantly changing in a terraform plan. In this case, please make sure you use the verbose/specific version of the policy. | `string` | `"{}"` | no |
| stage | Stage (e.g. `prod`, `dev`, `staging`) | `string` | `""` | no |
| tags | Additional tags (e.g. map(`BusinessUnit`,`XYZ`) | `map(string)` | `{}` | no |

## Outputs

| Name | Description |
|------|-------------|
| this\_kms\_key\_alias\_arn | n/a |
| this\_kms\_key\_alias\_name | n/a |
| this\_kms\_key\_arn | n/a |
| this\_kms\_key\_id | n/a |
