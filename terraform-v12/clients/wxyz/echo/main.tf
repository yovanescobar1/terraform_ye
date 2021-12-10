#++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
# backend state storage
#++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
terraform {
  backend "s3" {
    bucket                  = "escobar-tf-states"
    key                     = "wxyz/echo65/terraform.state"
    region                  = "us-east-1"
    shared_credentials_file = "/var/lib/jenkins/.aws/credentials"
    profile                 = "ctms"
    encrypt                 = true
  }
}

#++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
# providers
#++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
provider "aws" {
  shared_credentials_file = "/var/lib/jenkins/.aws/credentials"
  profile                 = "wxyz"
  region                  = "us-west-2"
  version                 = "~> 2.0"
}

provider "aws" {
  alias                   = "ctmsp"
  shared_credentials_file = "/var/lib/jenkins/.aws/credentials"
  profile                 = "ctms"
  region                  = "us-east-1"
}

provider "aws" {
  alias                   = "veolia"
  shared_credentials_file = "/var/lib/jenkins/.aws/credentials"
  profile                 = "veol"
  region                  = "us-east-1"
}

#--------------------------------------------------------------------------------------
# get lastest escobar AMI IDs (Use ena for newer gen instance types like m5 and up)
#--------------------------------------------------------------------------------------
data "aws_ami" "latest-centos-ena" {
  executable_users = ["self"]
  most_recent      = true
  name_regex       = "^escobar-centos-7-ena-2020*"
  owners           = ["043374741781"]

  filter {
    name   = "root-device-type"
    values = ["ebs"]
  }

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }
}

output "ami_id_linux_ena" {
  value = data.aws_ami.latest-centos-ena.id
}

#--------------------------------------------------------------------------------------
# get lastest escobar AMI IDs (Use this for older gen instance types like m4 and below)
#--------------------------------------------------------------------------------------
data "aws_ami" "latest-centos" {
  executable_users = ["self"]
  most_recent      = true
  name_regex       = "^escobar-centos-7-2020*"
  owners           = ["043374741781"]

  filter {
    name   = "root-device-type"
    values = ["ebs"]
  }

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }
}

output "ami_id_linux" {
  value = data.aws_ami.latest-centos.id
}

