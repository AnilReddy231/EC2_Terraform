terraform {
  backend "s3" {
    bucket = "terraform-trackit"
    key    = "forgerock/"
    region = "us-west-2"
    encrypt = "true"
  }
}