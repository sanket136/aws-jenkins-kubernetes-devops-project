resource "aws_instance" "terraform_master" {
  ami           = data.aws_ami.ubuntu.id
  instance_type = "t3.micro"

  subnet_id = aws_subnet.public.id

  vpc_security_group_ids = [
    aws_security_group.terraform_master_sg.id
  ]

  key_name = aws_key_pair.devops_key.key_name

  associate_public_ip_address = true

  tags = {
    Name    = "Terraform-Master"
    Project = var.project_name
    Role    = "Terraform-Ansible-Control"
  }
}