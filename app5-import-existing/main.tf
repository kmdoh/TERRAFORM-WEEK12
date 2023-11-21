# __generated__ by Terraform
# Please review these resources and move them into your main configuration files.

# __generated__ by Terraform
resource "aws_instance" "demo" {
  ami                                  = "ami-0230bd60aa48260c6"
  associate_public_ip_address          = true
  availability_zone                    = "us-east-1a"

  instance_initiated_shutdown_behavior = "stop"
  instance_type                        = "t2.micro"
  ipv6_address_count                   = 0
 
  key_name                             = "ec2-key"
  monitoring                           = false
 
  security_groups                      = ["launch-wizard-4"]
  source_dest_check                    = true
  subnet_id                            = "subnet-0e33c04713d73d0f8"
  tags = {
    Name = "kodzovi"
  }
  
}
