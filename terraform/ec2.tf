resource "aws_security_group" "ec2_sg" {
  name_prefix = "practice-ec2-sg"
  description = "Security group for practice EC2 instance"
  vpc_id      = aws_vpc.main.id

  ingress {
    description = "SSH from allowed CIDR"
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = [var.allowed_cidr]
  }

  ingress {
    description = "HTTP from allowed CIDR"
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = [var.allowed_cidr]
  }

  egress {
    description = "Allow all outbound traffic"
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name        = "practice-ec2-sg"
    Environment = "practice"
  }

  lifecycle {
    create_before_destroy = true
  }
}

resource "aws_instance" "example" {
  ami                         = var.ec2_ami
  instance_type               = var.ec2_instance_type
  subnet_id                   = aws_subnet.public.id
  associate_public_ip_address = true
  vpc_security_group_ids      = [aws_security_group.ec2_sg.id]
  key_name                    = "terraform-keypair"

  tags = {
    Name        = var.ec2_name
    Environment = "practice"
  }

  root_block_device {
    volume_type = "gp2"
    volume_size = 8
    encrypted   = true
  }
}