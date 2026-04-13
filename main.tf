terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.92"
    }
  }

  required_version = ">= 1.2"
}

provider "aws" {
  region = "us-west-2"
}

data "aws_ami" "ubuntu" {
  most_recent = true

  filter {
    name = "name"
    values = ["ubuntu/images/hvm-ssd-gp3/ubuntu-noble-24.04-amd64-server-*"]
  }

  owners = ["099720109477"] # Canonical
}

resource "aws_instance" "app_server" {
  ami           = data.aws_ami.ubuntu.id
  instance_type = "t2.micro"
key_name = "Iac-alura"
user_data = <<-EOF
#!/bin/bash
# Garante que estamos no diretório correto com o caminho absoluto
echo "<h1>Feito com Terraform</h1>" > /home/ubuntu/index.html

# Ajusta permissão para o usuário ubuntu conseguir ver/editar depois
chown ubuntu:ubuntu /home/ubuntu/index.html

# Sobe o servidor no diretório onde o arquivo foi criado
cd /home/ubuntu
nohup busybox httpd -f -p 8080 &
EOF
  tags = {
    Name = "teste-instancia"
  }
}
