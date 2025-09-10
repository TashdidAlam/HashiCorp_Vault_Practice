# HashiCorp Vault Practice

## Overview
This repository demonstrates secure secret management using HashiCorp Vault and Terraform on AWS. It covers deploying a Vault server, storing secrets, and configuring an EC2 instance to securely retrieve secrets from Vault.

## Objectives
- Deploy a Vault server (via Docker or directly on EC2)
- Initialize and unseal the Vault
- Store a secret (e.g., database credentials) in Vault
- Use Terraform to deploy an EC2 instance
- Configure the EC2 instance to fetch the secret from Vault and write it to a text file

## Architecture
- **Vault Server**: Deployed as a Docker container or directly on an EC2 instance
- **EC2 Instance**: Deployed via Terraform, securely fetches secrets from Vault
- **Secrets**: Only accessible by the EC2 instance, not exposed externally

## Files
- `terraform/` - Contains all Terraform configuration files for VPC, Vault, and EC2 deployment
- `vault/` - (If applicable) Vault configuration files and Docker Compose files

## Deployment Steps

### 1. Deploy Vault Server
- Option 1: **Docker**
	- Use provided Docker Compose or Dockerfile to run Vault locally or on an EC2 instance
- Option 2: **Direct EC2**
	- Use Terraform to provision an EC2 instance and install Vault

### 2. Initialize and Unseal Vault
- After Vault is running, initialize it using the Vault CLI:
	```sh
	vault operator init
	vault operator unseal
	```
- Save the unseal keys and root token securely

### 3. Store a Secret in Vault
- Use the Vault CLI or API to store a secret (e.g., database credentials):
	```sh
	vault kv put secret/db username="admin" password="password123"
	```

### 4. Deploy EC2 Instance with Terraform
- Use the Terraform files in the `terraform/` directory to deploy an EC2 instance
- The instance will be configured (via user data or provisioner) to authenticate with Vault and fetch the secret

### 5. Fetch Secret on EC2
- The EC2 instance runs a script to authenticate with Vault and write the secret to a text file (e.g., `/tmp/db_credentials.txt`)

## Security Notes
- Secrets are only accessible by the EC2 instance
- Vault is not exposed to the public internet
- Use IAM roles or Vault policies to restrict access

## Prerequisites
- AWS CLI configured
- Terraform installed
- Docker (if using Docker for Vault)

## Cleanup
- Use `terraform destroy` to remove all resources
