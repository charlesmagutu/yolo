provider "aws" {
  region     = var.aws_region
  access_key = var.aws_access_key
  secret_key = var.aws_secret_key
}

resource "aws_security_group" "yolo_security" {
  name        = "yolo_security"
  description = "Yolo Security group"

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

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

resource "aws_instance" "yolo_server" {
  ami              = "ami-0cd59ecaf368e5ccf"
  key_name         = var.key_name
  security_groups  = [aws_security_group.yolo_security.name]
  instance_type    = "t2.micro"

  tags = {
    Name = "yolo_app_server"
  }

  connection {
    type        = "ssh"
    user        = "ubuntu"
    private_key = file(var.private_key_path)
    host        = self.public_ip
  }

  provisioner "remote-exec" {
    inline = [
      "ssh-keyscan -H ${self.public_ip} >> ~/.ssh/known_hosts",
      "sudo apt-get update"
    ]
  }

  provisioner "local-exec" {
    command = "ansible-playbook -i ${self.public_ip}, ../playbook.yml --extra-vars 'target=${self.public_ip}' -u ubuntu --private-key=${var.private_key_path}"
  }

  provisioner "local-exec" {
    command = "echo 'Yolo Application deployment successful and can now be accessed on ${self.public_ip}:3000'"
  }
}
