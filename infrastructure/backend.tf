terraform {
  backend "s3" {
    bucket         = "lorenzoaiello-terraform-statefiles"
    key            = "website"
    region         = "us-west-2"
    dynamodb_table = "lorenzoaiello-terraform-lock"
    encrypt        = true
  }
}
