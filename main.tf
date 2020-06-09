resource "aws_default_vpc" "default" {

  tags = {
    Automation = "terraform"
    Name       = "default"
  }
}

resource "aws_default_subnet" "default_az1" {
  availability_zone = "${var.region}a"

  tags = {
    Automation = "terraform"
    Name       = "Default subnet for ${var.region}a"
  }
}

resource "aws_default_subnet" "default_az2" {
  availability_zone = "${var.region}b"

  tags = {
    Automation = "terraform"
    Name       = "Default subnet for ${var.region}b"
  }
}

resource "aws_default_subnet" "default_az3" {
  availability_zone = "${var.region}c"

  tags = {
    Automation = "terraform"
    Name       = "Default subnet for ${var.region}c"
  }
}

resource "aws_default_subnet" "default_az4" {
  availability_zone = "${var.region}d"

  tags = {
    Automation = "terraform"
    Name       = "Default subnet for ${var.region}d"
  }
}

resource "aws_default_network_acl" "default" {
  depends_on = [aws_default_vpc.default]

  default_network_acl_id = aws_default_vpc.default.default_network_acl_id

  subnet_ids = [
    aws_default_subnet.default_az1.id,
    aws_default_subnet.default_az2.id,
    aws_default_subnet.default_az3.id,
    aws_default_subnet.default_az4.id,
  ]

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
