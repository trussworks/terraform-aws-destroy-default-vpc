output "network_acl" {
  description = "The Default Network ACL"
  value       = aws_default_network_acl.default
}

output "route_table" {
  description = "The Default Route Table"
  value       = aws_default_route_table.default
}

output "security_group" {
  description = "The Default Security Group"
  value       = aws_default_security_group.default
}

output "subnets" {
  description = "The Default Subnets"
  value = [
    aws_default_subnet.default_az1,
    aws_default_subnet.default_az2,
    aws_default_subnet.default_az3,
    aws_default_subnet.default_az4,
  ]
}

output "vpc" {
  description = "The Default VPC"
  value       = aws_default_vpc.default
}

output "vpc_dhcp_options" {
  description = "The Default VPC DHCP Options Set"
  value       = aws_default_vpc_dhcp_options.default
}
