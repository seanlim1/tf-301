terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "5.31.0"
    }
  }

  backend "s3" {
    bucket         = "sctp-ce4-tfstate-bucket" # Don't change.
    key            = "tf-301-slim.tfstate" # Replace with unique project value (*.tfstate)
    region         = "ap-southeast-1"
    # dynamodb_table = "tf-state-lock" # Don't change.
  }
}

provider "aws" {
  region = "ap-southeast-1"
  ## Avoid passing credentials via provider!
  # access_key = ""
  # secret_key = ""
}
