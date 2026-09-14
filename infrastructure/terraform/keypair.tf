resource "aws_key_pair" "devops_key" {
  key_name = "${var.project_name}-key"

  public_key = file(pathexpand("~/.ssh/devops-project.pub"))

  tags = {
    Name    = "${var.project_name}-key"
    Project = var.project_name
  }
}