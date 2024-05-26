
#varibles 
provider "aws" {
  region     = var.aws_region
  access_key = var.aws_access_key
  secret_key = var.aws_secret_key
}

#security group for yolo application
resource "aws_security_group" "yolo_security" {
  name        = "yolo_security"
  description = "Yolo Security group"

#allow ibound ssh traffic through port 22
  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
#allow frontend traffic through port 3000
  ingress {
    from_port   = 3000
    to_port     = 3000
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port   = -1
    to_port     = -1
    protocol    = "icmp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "yolo_security"
  }
}

#create Ec2 instance for yolo application

resource "aws_instance" "yolo_server" {
  ami              = "ami-0cd59ecaf368e5ccf"
  key_name         = var.key_name
  security_groups  = [aws_security_group.yolo_security.name]
  instance_type    = "t2.micro"

  tags = {
    Name = "yolo_app_server"
  }

#connect using ssh to perform remote executions
  connection {
    type        = "ssh"
    user        = var.aws_user
    private_key = file(var.private_key_path)
    host        = self.public_ip
  }

#perform remote update and add hodt ip to list of known hosts
  provisioner "remote-exec" {
    inline = [
      "ssh-keyscan -H ${self.public_ip} >> ~/.ssh/known_hosts",
      "sudo apt-get update"
    ]
  }

#execute ansible playbook on Ec2 instance using local-exec module
  provisioner "local-exec" {
    command = "ansible-playbook -i ${self.public_ip}, ../playbook.yml --extra-vars 'target=${self.public_ip}' -u ${var.aws_user} --private-key=${var.private_key_path}"
  }

#output puplic ip of the provisioned instance and use it to access the deployed application
  provisioner "local-exec" {
    command = "echo 'Yolo Application deployment successful and can now be accessed on ${self.public_ip}:3000'"
  }
}
