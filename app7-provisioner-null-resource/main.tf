resource "aws_iam_group" "group1" {
  name = "DevOps"
}


resource "aws_instance" "name" {
  ami           = data.aws_ami.ami1.id
  instance_type = "t2.micro"
  key_name      = aws_key_pair.ec2_key.key_name

  depends_on = [aws_key_pair.ec2_key, aws_iam_group.group1,aws_security_group.ssh]

}

resource "null_resource" "null" {
  connection {
    type        = "ssh"
    user        = "ec2-user"
    private_key = "week12b.pem"
    host        = aws_instance.name.public_ip
  }
  provisioner "local-exec" {
    command = "echo hello"
  }
  provisioner "remote-exec" {
    inline = [
      "sudo yum update -y",
      "mkdir serge",
      "pwd",
      "nproc"
    ]
  }
  provisioner "file" {
    source      = "week12b.pem"
    destination = "/tmp/week12.pem"
  }
  depends_on = [aws_instance.name]
}
resource "aws_security_group" "ssh" {
  name        = "allow_ssh"
  description = "Allow inbound SSH traffic"

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"] # Adjust the CIDR block to restrict access if needed
  }
}



