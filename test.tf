provider "aws" {
  region     = "ap-south-1"
  
}
resource "aws_instance" "web" {
  ami           = "ami-05a5bb48beb785bf1"
  instance_type = "t2.micro"
  key_name      = "terra"
  user_data = <<-EOF
              #!/bin/bash
               sudo yum install httpd wget vim unzip -y
               sudo systemctl enable --now httpd
               sudo wget https://www.free-css.com/assets/files/free-css-templates/download/page286/dropbeat.zip -P /var/www/html
               sudo unzip /var/www/html/dropbeat.zip -d /var/www/html
               sudo rm -rf /var/www/html/dropbeat.zip
               sudo mv /var/www/html/*/* /var/www/html
               sudo systemctl restart httpd
               EOF
  tags = {
    Name = "terraform"


  }
}
resource "aws_key_pair" "kattpa" {
  key_name   = "terra"
  public_key = "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABgQDO0uCmqyKrZCw4hP6ri5gMXucNOMzfNAuLhQ0sz1Tslery9OL5IbqNgYJl34kL7ivbUBdUIbEwg2jwlMYYOfKSQgeG9olxSPaEGwXdfaXpaengFZ9uBXpfsKYdfh2ccSVTESv+4aRknlRe7wixLYkf+/SVDt36Xu96Q7Wycn4PE8QR8sKRcJJs1foEVO8jXOR7pv8Gc4+r3J27M/afEO2dZkBYJnGEEgSn+iiFcdos71RNbkkmjBACx9JiAWHHvwfm9SxhlCd7B7rCesOee9H135vmaAN7TLjKRx4eyqnUckF3FMU2A0NvRG2cum0mUCGJcHRxEcHWfiUFpkeVg514EhRHyM2uq1IYrct48uevFY0utinQbFbjPHT4KbBuQe3Gtp9seMvs7mDfJPcaestCayS7cxGhVEWR3BMWnzYTkZTBXD7ewpwO0sMC2nM4UeyE5JdGyEMqXtNmeX0PxnS2owzq26xowgki5aXx0UQ6+zXF0T4NyxtAfe0mrQRQryk= root@ip-172-31-46-213.ap-south-1.compute.internal"
}
