terraform {

  backend "s3" {

    bucket       = "payal-devops-poc-tfstate-bucket"

    key          = "bootstrap/backend/terraform.tfstate"

    region       = "ap-south-1"

    encrypt      = true

    use_lockfile = true

  }

}