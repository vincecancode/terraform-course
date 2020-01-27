resource "aws_key_pair" "mykey" {
  key_name   = "mykey"
  # public key content.
  # function "file" is used to load the content of the key from the path
  # Important: The key has to be created/existed in the parth before the terraform apply
  #            The way to create the key : ssh-keygen -f mykey
  public_key = file(var.PATH_TO_PUBLIC_KEY)
}

resource "aws_instance" "example" {
  ami           = var.AMIS[var.AWS_REGION]
  instance_type = "t2.micro"
  # The public key to be imported to the target instance, used for remote access
  key_name      = aws_key_pair.mykey.key_name

  # The file to be uploaded to the target instance, where source is in relative location of this script
  provisioner "file" {
    source      = "script.sh"
    destination = "/tmp/script.sh"
  }

  # Call the remote execution of the script after the system boots
  provisioner "remote-exec" {
    inline = [
      "chmod +x /tmp/script.sh",
      "sudo /tmp/script.sh",
    ]
  }
  connection {
    host        = coalesce(self.public_ip, self.private_ip)
    type        = "ssh"
    user        = var.INSTANCE_USERNAME
    private_key = file(var.PATH_TO_PRIVATE_KEY)
  }
}

