terraform {
  required_version = "~> 1.0.8"
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      #version = "~> 3.62.0"
    }
  }
#   backend "s3" {
#     bucket = "xsalazar-terraform-state"
#     key    = "terraform-aws-docker-deploy/terraform.tfstate"
#     region = "us-east-1"
# #     aws-access-key-id =  ${{ secrets.AWS_ACCESS_KEY_ID }}
# #     aws-secret-access-key = ${{ secrets.AWS_SECRET_ACCESS_KEY }}
#   }
}

provider "aws" {
  region = "us-east-1"
  default_tags {
    tags = {
      CreatedBy = "terraform"
    }
  }
}

output "alb_dns" {
  value = aws_lb.instance.dns_name
}

output "ecr_repository_name" {
  value = aws_ecr_repository.instance.name
}
