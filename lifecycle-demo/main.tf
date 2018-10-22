provider "aws" {}
resource "aws_security_group" "training" {
    name_prefix = "demo-modified"
    ingress {
        from_port = 0
        to_port = 0
        protocol = "tcp"
        cidr_blocks = ["0.0.0.0/0"]
    }
    egress {
        from_port = 0
        to_port = 0
        protocol = "tcp"
        cidr_blocks = ["0.0.0.0/0"]
    }
}
resource "aws_instance" "web" {
    ami = "ami-0735ea082a1534cac"
    instance_type = "t2.micro"
    vpc_security_group_ids = ["${aws_security_group.training.id}"]
    tags {
        Name = "demo-simple-instance"
    }
}