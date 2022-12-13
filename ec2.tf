resource "aws_instance" "web" {
  ami           = var.AMI_ID
  instance_type = var.INSTANCE_TYPE
  ebs_optimized = true
  monitoring = true
  root_block_device {
  encrypted     = true
  }
  tags = {
    Name = "airbnb-web-server1"
  }
}