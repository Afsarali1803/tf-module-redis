# Creates Security Group
resource "aws_security_group" "allows_redis" {
  name               = "roboshop-${var.ENV}-redis"
  description        = "roboshop-${var.ENV}-redis"
  vpc_id             = data.terraform_remote_state.vpc.outputs.VPC_ID

  ingress {
    description      = "Allow redis from default VPC"
    from_port        = 6379
    to_port          = 6379
    protocol         = "tcp"
    cidr_blocks      = [data.terraform_remote_state.vpc.outputs.DEFAULT_VPC_CIDR]
  }

  ingress {
    description      = "Allow redis from default VPC"
    from_port        = 6379
    to_port          = 6379
    protocol         = "tcp"
    cidr_blocks      = [data.terraform_remote_state.vpc.outputs.VPC_CIDR]
  }

  egress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
  }

  tags = {
    Name = "roboshop-${var.ENV}-redis"
  }
}
