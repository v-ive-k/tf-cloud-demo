module "ec2" {
  source = "git::https://github.com/v-ive-k/terraform-aws-ec2.git?ref=v1.0.0"

  ami_id         = "ami-0c02fb55956c7d316"
  instance_type  = "t2.micro"
  instance_name  = "vivek-module-ec2"

  tags = {
    Environment = "dev"
    Owner       = "vivek"
    ManagedBy   = "terraform"
  }
}
