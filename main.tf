provider "aws" {
	region = "us-west-2"
}

resource "aws_vpc" "vpc" {
	cidr_block = "10.0.0.0/16"
	enable_dns_hostnames = true
	tags {
		Name = "sunil_test_vpc"
	}
}

resource "aws_internet_gateway" "igw" {
	vpc_id = "${aws_vpc.vpc.id}"
}

resource "aws_subnet" "pub_subnet" {
	vpc_id = "${aws_vpc.vpc.id}"
	cidr_block = "10.0.1.0/24"
	availability_zone = "us-west-2a"
	tags {
		Name = "pub_subnet"
	}
}

resource "aws_subnet" "pub_subnetb" {
	vpc_id = "${aws_vpc.vpc.id}"
	cidr_block = "10.0.2.0/24"
	availability_zone = "us-west-2a"
	tags {
		Name = "pub_subnet"
	}
}

resource "aws_route_table" "pub_rt" {
	vpc_id = "${aws_vpc.vpc.id}"
	route {
		cidr_block = "0.0.0.0/0"
		gateway_id = "${aws_internet_gateway.igw.id}"
	}
	tags {
		Name = "Public Route Table"
	}
}

resource "aws_route_table_association" "pub_rta" {
	subnet_id = "${aws_subnet.pub_subnet.id}"
	route_table_id = "${aws_route_table.pub_rt.id}"
}
	
