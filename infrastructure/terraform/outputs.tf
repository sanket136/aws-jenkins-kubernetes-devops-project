output "terraform_master_public_ip" {
  description = "Public IP of Terraform and Ansible control node"
  value       = aws_instance.terraform_master.public_ip
}

output "terraform_master_private_ip" {
  description = "Private IP of Terraform and Ansible control node"
  value       = aws_instance.terraform_master.private_ip
}

output "jenkins_master_private_ip" {
  value = aws_instance.jenkins_master.private_ip
}

output "jenkins_master_public_ip" {
  value = aws_instance.jenkins_master.public_ip
}

output "kubernetes_master_private_ip" {
  value = aws_instance.kubernetes_master.private_ip
}

output "kubernetes_master_public_ip" {
  value = aws_instance.kubernetes_master.public_ip
}

output "kubernetes_worker_private_ip" {
  value = aws_instance.kubernetes_worker.private_ip
}

output "kubernetes_worker_public_ip" {
  value = aws_instance.kubernetes_worker.public_ip
}