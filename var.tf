variable "AMI_ID" {
  type = string
  description = "AMI Id"
  default = "ami-0ee679ef733e3b8e7"
}

variable "INSTANCE_TYPE" {
    type = string
    description = "Type of ec2 instance"
    default = "t3.micro"
  
}