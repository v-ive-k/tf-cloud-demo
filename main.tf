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
