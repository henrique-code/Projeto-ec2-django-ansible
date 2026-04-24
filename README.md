# Provisionamento de Instância EC2 com Terraform e Ansible com dependencias django prontas para uso

Este projeto automatiza a criação de uma infraestrutura básica na AWS utilizando Terraform e ansible. O objetivo principal é subir uma instância EC2 de forma rápida e programática com dependencia django e django rest instaladas e configuradas pronto para uso

## 🚀 Tecnologias Utilizadas
* [Terraform](https://terraform.io)
* [AWS CLI](https://amazon.com)
* [Provedor AWS](https://terraform.io)
* [Ansible](https://docs.ansible.com/)

## 📋 Pré-requisitos
Antes de começar, você vai precisar:
1. Ter o **Terraform** instalado.
2. Ter o **Ansible** instalado.
3. Ter o **AWS CLI** configurado com suas credenciais (`aws configure`).
4. Uma conta ativa na AWS.

## 🔧 Como usar

1. **Clone o repositório:**
   ```bash
   git clone https://github.com/henrique-code/Projeto-ec2-django-ansible
   cd Projeto-ec2-django-ansible

2. **Alterar arquivo:**
   Alterar no arquivo main.tf o objeto "key_name" substituir pelo nome real da sua chave de acesso pem da AWS

3. **Inicie o Terraform:**
   ```bash
   terraform init
   ```

4. **Aplique a configuração:**
   ```bash
   terraform plan
   terraform apply
   ```
   
5. **Ronomeie o ip do arquivo hosts:**
   E necessario alterar o ip do arquivo hosts, para o ipv4 da sua maquina da AWS
   
6. **Rode o ansible:**
   ```bash
   ansible-playbook playbook.yml -u ubuntu --private-key "sua key aqui.pem" -i hosts.yml
   ```

7. **Acessar sua instancia da aws e verificar django**
   Acesse sua instancia atraves do ip e porta padrão do django e verifique se o django esta em execução

