data "aws_region" "current" {}

resource "aws_default_vpc" "default" {

  tags = {
    Automation = "terraform"
    Name       = "default"
  }
}


resource "aws_default_subnet" "default_azs" {
  count             = length(var.azs)
  availability_zone = "${data.aws_region.current}${var.azs[count.index]}"

  tags = {
    Automation = "terraform"
    Name       = "Default subnet for ${data.aws_region.current}${var.azs[count.index]}"
  }
}

resource "aws_default_network_acl" "default" {
  depends_on = [aws_default_vpc.default]

  default_network_acl_id = aws_default_vpc.default.default_network_acl_id

  subnet_ids = aws_default_subnet.default_azs.*.id

  tags = {
    Automation = "terraform"
    Name       = "default"
  }
}

resource "aws_default_route_table" "default" {
  depends_on = [aws_default_vpc.default]

  default_route_table_id = aws_default_vpc.default.default_route_table_id

  tags = {
    Automation = "terraform"
    Name       = "default"
  }
}

resource "aws_default_security_group" "default" {
  depends_on = [aws_default_vpc.default]

  vpc_id = aws_default_vpc.default.id

  tags = {
    Automation = "terraform"
    Name       = "default"
  }
}

resource "aws_default_vpc_dhcp_options" "default" {
  depends_on = [aws_default_vpc.default]

  tags = {
    Automation = "terraform"
    Name       = "default"
  }
}
