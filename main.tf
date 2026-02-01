module "terraform-aws-ec2" {
  source  = "app.terraform.io/Vivek-Infra/terraform-aws-ec2/aws"
  version = "1.0.0"
  
  ami_id         = "ami-0c02fb55956c7d316"
  instance_type  = "t2.micro"
  instance_name  = "vivek-module-ec2"

  tags = {
    Environment = "dev"
    Owner       = "vivek"
    ManagedBy   = "terraform"
  }
}

module "terraform-aws-ec2-imported" {
  source  = "app.terraform.io/Vivek-Infra/terraform-aws-ec2/aws"
  version = "1.0.2"
  
  ami_id         = "ami-0532be01f26a3de55"
  instance_type  = "t2.micro"
  instance_name  = "imported-ec2"

  tags = {
    ManagedBy = "terraform"
    Purpose   = "import-demo"
  }
}

