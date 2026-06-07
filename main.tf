resource "aws_security_group" "nlb_sg" {
  name   = "test-nlb-sg"
  vpc_id = "vpc-0f12ead71ccad59ef"

  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"

    cidr_blocks = [
      "192.168.0.174/32"
    ]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

resource "aws_security_group" "ec2_sg" {
  name   = "test-ec2-sg"
  vpc_id = "vpc-0f12ead71ccad59ef"

  ingress {
    from_port       = 80
    to_port         = 80
    protocol        = "tcp"

    security_groups = [
      aws_security_group.nlb_sg.id
    ]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

# ami block for Amazon Linux
data "aws_ami" "amazon_linux" {
  most_recent = true

  owners = ["137112412989"] # Amazon

  filter {
    name   = "name"
    values = ["al2023-ami-*-x86_64"]
  }
}

resource "aws_instance" "web" {
  ami           = data.aws_ami.amazon_linux.id
  instance_type = "t3.micro"

  subnet_id = "subnet-038066ae0ef9a1731"

  vpc_security_group_ids = [
    aws_security_group.ec2_sg.id
  ]

  user_data = <<-EOF
#!/bin/bash
dnf install nginx -y
systemctl enable nginx
systemctl start nginx
EOF
}

resource "aws_lb" "test" {

  name               = "test-nlb"
  load_balancer_type = "network"

  internal = false

  subnets = ["subnet-038066ae0ef9a1731","subnet-094799e025ec5a6dd"]

  security_groups = [
    aws_security_group.nlb_sg.id
  ]
}

resource "aws_lb_target_group" "test" {

  name     = "test-tg"

  port     = 80
  protocol = "TCP"

  vpc_id = "vpc-0f12ead71ccad59ef"

  health_check {
    protocol = "HTTP"
    path     = "/"
  }
}

resource "aws_lb_target_group_attachment" "test" {

  target_group_arn = aws_lb_target_group.test.arn

  target_id = aws_instance.web.id

  port = 80
}

resource "aws_lb_listener" "http" {

  load_balancer_arn = aws_lb.test.arn

  port     = 80
  protocol = "TCP"

  default_action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.test.arn
  }
}