output "vpc_id" {
    value = "${element(concat(aws_vpc.vpc.*.id, list("")), 0)}"
}
