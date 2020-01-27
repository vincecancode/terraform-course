resource "aws_instance" "example" {
  ami           = var.AMIS[var.AWS_REGION]
  instance_type = "t2.micro"
  # Following is the script which will run locally (not at the target server),
  # so in this example, we can use the private_ips.txt to construct the host file for ansible use.
  provisioner "local-exec" {
    command = "echo ${aws_instance.example.private_ip} >> private_ips.txt"
  }
}

# For the following. it will show in the Output section like "ip = 52.212.28.166"
output "ip" {
  value = aws_instance.example.public_ip
}

