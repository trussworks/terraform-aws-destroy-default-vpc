# DEPRECIATION NOTICE
This module has been deprecated and is no longer maintained. Should you need to continue to use it, please fork the repository. Thank you.
 Supports management of all default networking resources in an AWS region. Use this module to lock down those
resource by removing ingress/egress rules for the default network ACL and the ingress/egress rules for the default
security group rules. These resources are special so please read the accompanying documentation below.

Resources supported:

- [aws_default_network_acl](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/default_network_acl)
- [aws_default_route_table](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/default_route_table)
- [aws_default_security_group](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/default_security_group)
- [aws_default_subnet](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/default_subnet)
- [aws_default_vpc](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/default_vpc)
- [aws_default_vpc_dhcp_options](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/default_vpc_dhcp_options)

**WARNING:** The management of default VPC resources in AWS is meant to close security holes and follow best
practices. If you have an architecture that relies on default VPC resources **DO NOT** use this module until those
resources have been moved to non-default resources. Once you apply this module to your architecture it is
incredibly hard to undo as simply removing the module will not "reset" any changes made by the module. Please
read the linked terraform docs above for more information about managing default resources.

## Terraform Versions

Terraform 0.13 and newer. Pin module version to ~> 2.X . Submit pull-requests to master branch.

Terraform 0.12. Pin module version to ~> 1X . Submit pull-requests to terraform012 branch.


## Usage

```hcl
# Allows all services to log to bucket
module "default_vpc" {
  source = "trussworks/destroy-default-vpc/aws"
}
```

An example that will apply to all regions in an account:

```hcl
data "aws_regions" "current" {}

module "default_vpc" {
  source = "trussworks/destroy-default-vpc/aws"
  for_each = toset(data.aws_regions.current.names)
  region = each.value
}
```

<!-- BEGINNING OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 0.13 |
| <a name="requirement_aws"></a> [aws](#requirement\_aws) | >= 3.0 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_aws"></a> [aws](#provider\_aws) | >= 3.0 |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [aws_default_network_acl.default](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/default_network_acl) | resource |
| [aws_default_route_table.default](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/default_route_table) | resource |
| [aws_default_security_group.default](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/default_security_group) | resource |
| [aws_default_subnet.default_azs](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/default_subnet) | resource |
| [aws_default_vpc.default](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/default_vpc) | resource |
| [aws_default_vpc_dhcp_options.default](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/default_vpc_dhcp_options) | resource |
| [aws_region.current](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/region) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_azs"></a> [azs](#input\_azs) | List of AZs to manage using only the letters, not full AZ name | `list(string)` | <pre>[<br>  "a",<br>  "b",<br>  "c",<br>  "d"<br>]</pre> | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_network_acl"></a> [network\_acl](#output\_network\_acl) | The Default Network ACL |
| <a name="output_route_table"></a> [route\_table](#output\_route\_table) | The Default Route Table |
| <a name="output_security_group"></a> [security\_group](#output\_security\_group) | The Default Security Group |
| <a name="output_subnets"></a> [subnets](#output\_subnets) | The Default Subnets |
| <a name="output_vpc"></a> [vpc](#output\_vpc) | The Default VPC |
| <a name="output_vpc_dhcp_options"></a> [vpc\_dhcp\_options](#output\_vpc\_dhcp\_options) | The Default VPC DHCP Options Set |
<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->

## Upgrade Paths

### Upgrading from 1.0.0 to TBD

TBD - No upgrade paths yet

## Developer Setup

Install dependencies (macOS)

```shell
brew install pre-commit terraform terraform-docs
```

### Testing

```shell
make test
```
