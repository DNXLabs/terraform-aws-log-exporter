terraform {
  required_version = ">= 0.12.0"

  required_providers {
    aws = {
      version = ">= 4.61.0"
    }
    random = {
      version = ">= 3.4.0"
    }
  }
}