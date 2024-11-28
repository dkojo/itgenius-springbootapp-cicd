terraform {
  backend "s3" {
    bucket         = "itgenius-springboot-app-s3-bucket"
    key            = "terraform_statefile"
    region         = "us-east-1"
    dynamodb_table = "itgenius-springboot-app-dynamoDB"
  }
}

