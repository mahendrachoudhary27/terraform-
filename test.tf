provider "aws" {
  region     = "ap-south-1"
  access_key = "AKIAS3FILAAGMYVHOZ6H"
  secret_key = "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"
}
resource "aws_instance" "web" {
  ami           = "ami-04708942c263d8190"
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
    Name = "salt"


  }
}
resource "aws_key_pair" "kattpa" {
  key_name   = "terra"
  public_key = "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABgQDI/9qXVi3POnze1MJfv+mVk/c5COJmK2cV7dVL5k3lwRW9xxzXlhPTXKQAUwQJHvjwhNzbtglPgaiIklU4TwSsykYfz8OsoQa2ZiToINBB3eqkLdkVgWrtYrOIT6ChrL+fUoBom7az9EebWVsQQYpIH5qQAa8iNkKIvt4VGTeMaeMEnJvd+S7v4lk1A/P4TVLQ+NiMlw5VPUcNCxUAJoDSl2Gg+OzrYsfBe+fWFWCTKupevOKXRm3MnbCqpo3yrtrA4/jfjqxh7NkUzDemEW3oZ3rkVX8rnKfyEvOEZyDAM7FfBYwVbW2bEq1hbMmAMhs5IyOrJkxp/qb74j6Dcjq+K0pUFCNrLqLRPZWkYsMgq74g/opkREoAeMztxxMPoDvtyOLUP9jzRG29MSQ0of8lW38pitIOrrrxsBW7IHs1IIVYyNi7gJq3deYbFz8Bkc+hEvpw7E0Sg0CTIjV3GN4ORnyhIyN9Yk0/oXO04YE481jbkkQLTbyO2EQD4KbqYlk= mahen@Agrofincare"
