# AWS Jenkins Kubernetes DevOps Project

End-to-end DevOps automation project using Terraform, Ansible, Jenkins, Docker, Docker Hub, and Kubernetes on AWS.

The project provisions AWS infrastructure using Terraform, configures servers using Ansible, builds and pushes Docker images using Jenkins, and automatically deploys the application to a Kubernetes cluster.

## Architecture

Developer
   |
   v
GitHub Repository
   |
   v
Jenkins Master
   |
   v
Jenkins Agent
(Kubernetes Control Plane)
   |
   +---- Docker Build
   |
   +---- Docker Hub Push
   |
   v
Kubernetes Cluster
   |
   +---- Control Plane
   |
   +---- Worker Node
            |
            +---- 5 Application Pods
   |
   v
NodePort Service :30010
   |
   v
Browser

Project Workflow
	1. Terraform provisions the AWS networking and EC2 infrastructure. 
	2. Ansible configures Jenkins and Kubernetes nodes. 
	3. Jenkins checks out source code from GitHub. 
	4. Jenkins builds the Docker image. 
	5. Jenkins authenticates with Docker Hub. 
	6. The Docker image is pushed to Docker Hub. 
	7. Jenkins deploys the new image to Kubernetes. 
	8. Kubernetes performs a rolling deployment across five replicas. 
	9. The application is exposed using NodePort 30010. 
Infrastructure
The AWS environment contains:
	• Terraform / Ansible Control Node 
	• Jenkins Master 
	• Kubernetes Control Plane 
	• Kubernetes Worker 
	• VPC 
	• Public subnet 
	• Internet Gateway 
	• Route Table 
	• Security Group 
	• EC2 Key Pair 
Terraform is used to provision and manage the infrastructure.
Ansible Automation
Ansible is installed on the Terraform control node and manages the remaining EC2 instances.
The Ansible automation performs:
	• Jenkins installation 
	• Java installation 
	• Docker installation 
	• Kubernetes prerequisites 
	• containerd configuration 
	• kubeadm, kubelet and kubectl installation 
	• Kubernetes control-plane initialization 
	• Jenkins agent configuration 

Example structure:



Jenkins Architecture
The Jenkins Master runs on a dedicated EC2 instance.
The Kubernetes control-plane instance is also configured as a Jenkins agent.
The Jenkins agent contains:
	• Java 21 
	• Docker 
	• kubectl 
	• Kubernetes cluster access 
Jenkins executes the CI/CD pipeline on this agent.

Docker
The application is packaged using Nginx.

Dockerfile:
FROM nginx:alpine
COPY index.html /usr/share/nginx/html/index.html
EXPOSE 80

Docker images are pushed to:
sanket9401/aws-jenkins-kubernetes-devops-project
Images are tagged using the Jenkins build number and also as latest.

Kubernetes
The Kubernetes cluster contains:
	• 1 Control Plane 
	• 1 Worker Node 
	• Flannel CNI 
	• CoreDNS 
	• kube-proxy 

The application is deployed using five replicas.
replicas: 5

The application is exposed using:
Service Type: NodePort
NodePort: 30010

Jenkins CI/CD Pipeline
The Jenkins pipeline contains the following stages:

Checkout
   |
   v
Build Docker Image
   |
   v
Docker Login
   |
   v
Push Docker Image
   |
   v
Deploy to Kubernetes

The pipeline:
	• checks out the source code 
	• builds the Docker image 
	• authenticates with Docker Hub 
	• pushes the versioned image 
	• applies the Kubernetes manifests 
	• updates the Deployment image 
	• waits for successful rollout 

Project Structure



Validation
Jenkins Pipeline
Jenkins Agent
Kubernetes Pods
Kubernetes Service
Application

Kubernetes Verification

Deployment:
NAME         READY   UP-TO-DATE   AVAILABLE
devops-app   5/5     5            5

Service:
NAME                 TYPE       PORT(S)
devops-app-service   NodePort   80:30010/TCP

Technologies Used
	• AWS 
	• Terraform 
	• Ansible 
	• Jenkins 
	• GitHub 
	• Docker 
	• Docker Hub 
	• Kubernetes 
	• Flannel 
	• Linux 
	• Nginx 

Security Notes
For this lab environment, some network rules are intentionally simplified.
For a production environment, I would improve the design by:
	• using private subnets for internal workloads 
	• restricting SSH and Jenkins access to trusted IP ranges 
	• using separate security groups for each server role 
	• using AWS Secrets Manager or another secrets solution 
	• avoiding direct storage of private keys on control servers 
	• enabling encrypted Terraform remote state 
	• using IAM roles with least privilege 
	• using a managed Kubernetes service such as Amazon EKS for production workloads 

Result
The project successfully demonstrates an automated CI/CD workflow:

GitHub -> Jenkins -> Docker -> Docker Hub -> Kubernetes -> Application
A source-code change can be built, packaged, pushed and deployed through the Jenkins pipeline to the Kubernetes cluster.


<img width="678" height="4867" alt="image" src="https://github.com/user-attachments/assets/f2bb85c5-7b94-4430-b8aa-42a7d4a86990" />
