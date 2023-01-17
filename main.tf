
provider "aws" {

  region = var.aws_region

  access_key = var.access_key

  secret_key = var.secret_access_key
 
}

resource "aws_s3_bucket" "my-s3-bucket" {

  bucket = var.bucket_name

  acl = var.acl

  object_lock_enabled = true

  lifecycle_rule {

    id = "archive"

    enabled = true
    
    transition {

      days = 30

      storage_class = "STANDARD_IA"
    }

    transition {

      days          = 60

      storage_class = "GLACIER"
    }

  }
  

  versioning {

    enabled = var.versioning
  }

  tags = var.tags
    
  

  server_side_encryption_configuration {

    rule {

      apply_server_side_encryption_by_default {
        
        sse_algorithm = "aws:kms"
      }
    }
  }
}

resource "aws_s3_bucket_object" "singleobject" {

  bucket = aws_s3_bucket.my-s3-bucket.id 

  key    = "test.txt"

  source = "C:\\Users\\jayas\\OneDrive\\Documents\\test.txt"
  
  etag = filemd5("C:\\Users\\jayas\\OneDrive\\Documents\\test.txt")

 
}
  

