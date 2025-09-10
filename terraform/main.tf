variable "ec2_ami" {
	description = "AMI ID for the EC2 instance"
	type        = string
}

variable "region" {
	description = "AWS region to deploy resources in"
	type        = string
	validation {
		condition     = can(regex("^[a-z]{2}-[a-z]+-[0-9]{1}$", var.region))
		error_message = "Region must be a valid AWS region (e.g., us-east-1)"
	}
}

variable "vpc_cidr" {
	description = "CIDR block for the VPC"
	type        = string
	validation {
		condition     = can(cidrhost(var.vpc_cidr, 0))
		error_message = "Must be a valid IPv4 CIDR block"
	}
}

variable "vpc_name" {
	description = "Name tag for the VPC"
	type        = string
}

variable "public_subnet_cidr" {
	description = "CIDR block for the public subnet"
	type        = string
	validation {
		condition     = can(cidrhost(var.public_subnet_cidr, 0))
		error_message = "Must be a valid IPv4 CIDR block"
	}
}

variable "private_subnet_cidr" {
	description = "CIDR block for the private subnet"
	type        = string
	validation {
		condition     = can(cidrhost(var.private_subnet_cidr, 0))
		error_message = "Must be a valid IPv4 CIDR block"
	}
}

variable "public_subnet_az" {
	description = "Availability zone for the public subnet"
	type        = string
}

variable "private_subnet_az" {
	description = "Availability zone for the private subnet"
	type        = string
}

variable "ec2_ami" {
	description = "AMI ID for the EC2 instance"
	type        = string
}

variable "ec2_instance_type" {
	description = "EC2 instance type"
	type        = string
	validation {
		condition     = can(regex("^[a-z][0-9]{1,3}\\.[a-z]+$", var.ec2_instance_type))
		error_message = "Instance type must be a valid AWS instance type (e.g., t2.micro)"
	}
}

variable "ec2_name" {
	description = "Name tag for the EC2 instance"
	type        = string
}

variable "allowed_cidr" {
	description = "CIDR block allowed to access the EC2 instance"
	type        = string
	default     = "0.0.0.0/0"
	validation {
		condition     = can(cidrhost(var.allowed_cidr, 0))
		error_message = "Must be a valid IPv4 CIDR block"
	}
}
