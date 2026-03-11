provider "aws" {
  region = "us-east-1"
}

resource "aws_instance" "one" {
  count                  = 4
  ami                    = "ami-0b6c6ebed2801a5cb"
  instance_type          = "c7i-flex.large"
  key_name               = "KEY_PAIR"
  vpc_security_group_ids = ["sg-01888a5022433d5ee"]
  tags = {
    Name = var.instance_names[count.index]
  }
}

variable "instance_names" {
  default = ["jenkins", "tomcat-1", "tomcat-2", "Monitoring server"]
}
