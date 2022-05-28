output "id_subnet" {
    value = ["${aws_subnet.subnet-1.id}", "${aws_subnet.subnet-2.id}"]
}

output "id_vpc" {
    value = aws_vpc.main.id
}