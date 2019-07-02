provider "aws" {
  region = "us-west-2"
}

provider "aws-use1" {
  alias  = "east"
  region = "us-east-1"
}
