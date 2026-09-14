resource "aws_instance" "jenkins_master" {
  ami           = data.aws_ami.ubuntu.id
  instance_type = "t3.small"

  subnet_id = aws_subnet.public.id

  vpc_security_group_ids = [
    aws_security_group.terraform_master_sg.id
  ]

  key_name = aws_key_pair.devops_key.key_name

  associate_public_ip_address = true

  tags = {
    Name    = "Jenkins-Master"
    Project = var.project_name
    Role    = "Jenkins-Master"
  }
}

resource "aws_instance" "kubernetes_master" {
  ami           = data.aws_ami.ubuntu.id
  instance_type = "t3.small"

  subnet_id = aws_subnet.public.id

  vpc_security_group_ids = [
    aws_security_group.terraform_master_sg.id
  ]

  key_name = aws_key_pair.devops_key.key_name

  associate_public_ip_address = true

  tags = {
    Name    = "Kubernetes-Master"
    Project = var.project_name
    Role    = "Kubernetes-Master-Jenkins-Agent"
  }
}

resource "aws_instance" "kubernetes_worker" {
  ami           = data.aws_ami.ubuntu.id
  instance_type = "t3.small"

  subnet_id = aws_subnet.public.id

  vpc_security_group_ids = [
    aws_security_group.terraform_master_sg.id
  ]

  key_name = aws_key_pair.devops_key.key_name

  associate_public_ip_address = true

  tags = {
    Name    = "Kubernetes-Worker"
    Project = var.project_name
    Role    = "Kubernetes-Worker"
  }
}