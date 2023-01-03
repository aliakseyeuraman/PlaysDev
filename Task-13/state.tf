terraform {
  backend "s3" {
    bucket = "myterraformstatetestbucket"
    key    = "terraformtf.state"
    region = "us-east-1"
  }
}