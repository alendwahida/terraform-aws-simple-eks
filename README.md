# Deploy simple EKS with terraform
This project only show the example deploy EKS using terraform with no module, you need to know about Cloud AWS fundamental & Infrastructure as code Principal, do with your own risk

<p align="center">
<img src="https://raw.githubusercontent.com/alendwahida/terraform-aws-simple-eks/main/blob/awn-simple-eks-project-vpc.jpg"></img>
</p>

# terraform-aws-simple-eks

Tutorial:
- Install Terraform (This project use Terraform v1.1.8)
- Install awscli (AWS CLI Version i used : aws-cli/1.16.60 Python/3.6.0 botocore/1.12.50)
- Install kubectl

### 1. Create Iam User Using Role Administrator & Generate secret access key
### 2. AWS Configure & Input your secret access key, use region us-east-1 in example
   ```bash
   aws configure
   ```
### 3. Clone & Terraform apply
   - Edit terraform.tfvars file to config EKS Configuration
   ```bash
   git clone https://github.com/alendwahida/terraform-aws-simple-eks.git
   cd terraforaws-simple-eks
   terraform init
   terraform plan
   terraform apply
   ```
### 4. Make sure if you use correct iam user
   ```bash
   aws sts get-caller-identity
   ```
### 5. Update kubeconfig connect to project
   ```bash
   aws eks update-kubeconfig --name awn-simple-eks-project-eks --region us-east-1
   ```
### 6. Try kubectl get svc
   ```bash
   kubectl get service
   ```
   
### source: 
- https://learn.hashicorp.com/collections/terraform/aws-get-started
