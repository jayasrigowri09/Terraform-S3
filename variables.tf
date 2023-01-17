
variable "access_key" {
    default = ""
}

variable "secret_access_key" {
    default = ""
}

variable "aws_region" {
    default = "us-east-2"
}

variable "acl" {
    default = "private"
}

variable "tags" {
    default   = {
        environment = "DEV"
       
    }
}

variable "versioning" {
    default = true
}

variable "bucket_name" {
    default = "my-s3-bucket-0123"
}