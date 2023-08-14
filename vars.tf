variable "aws_region" {
  type        = string
  default     = "ap-east-1"
  description = "AWS region"
}


# [ap-east-1_HK]
# Ubuntu(Ubuntu Server 22.04 LTS (HVM))   x86 ami-05ec72576b2b4738f
# Ubuntu(Ubuntu Server 22.04 LTS (HVM))   ARM ami-017c46772df7b16fc
# Debian 12 (HVM)                         x86 ami-069990f2c4286df41
# Debian 12 (HVM)                         ARM ami-02f6b21f08d924819
# NixOS                                   none  ami-07ba84d7321f6f4bb

variable "ami_image" {
  type        = string
  default     = "ami-069990f2c4286df41" #Debian 12 x86
  description = "AWS AMIs"
}

variable "key_name" {
  type        = string
  description = "Access key for EC2"
}

variable "private_key_path" {
  type        = string
  default     = ""
  description = "local path to private key"
}