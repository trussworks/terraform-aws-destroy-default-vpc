resource "aws_default_vpc" "default" {

  tags = merge(var.tags, {
    Name = "default",
  })
}


resource "aws_default_subnet" "default_azs" {
  count             = length(var.azs)
  availability_zone = "${var.region}${var.azs[count.index]}"

  tags = merge(var.tags, {
    Name = format("Default subnet for %s%s", var.region, var.azs[count.index]),
  })
}

resource "aws_default_network_acl" "default" {
  depends_on = [aws_default_vpc.default]

  default_network_acl_id = aws_default_vpc.default.default_network_acl_id

  subnet_ids = aws_default_subnet.default_azs.*.id

  tags = merge(var.tags, {
    Name = "default",
  })
}

resource "aws_default_route_table" "default" {
  depends_on = [aws_default_vpc.default]

  default_route_table_id = aws_default_vpc.default.default_route_table_id

  tags = merge(var.tags, {
    Name = "default",
  })
}

resource "aws_default_security_group" "default" {
  depends_on = [aws_default_vpc.default]

  vpc_id = aws_default_vpc.default.id

  tags = merge(var.tags, {
    Name = "default",
  })
}

resource "aws_default_vpc_dhcp_options" "default" {
  depends_on = [aws_default_vpc.default]

  tags = merge(var.tags, {
    Name = "default",
  })
}
