#create a s3 bucket
resource "aws_s3_bucket" "s3-static" {
  bucket = var.bucketname
  
}

resource "aws_s3_bucket_ownership_controls" "s3-ownership"{
  bucket = aws_s3_bucket.s3-static.id

  rule {
    object_ownership =  "BucketOwnerPreferred"
  }
}

resource "aws_s3_bucket_public_access_block" "s3-public-access" {
  bucket = aws_s3_bucket.s3-static.id

  block_public_acls       = false
  block_public_policy     = false
  ignore_public_acls      = false
  restrict_public_buckets = false
}

resource "aws_s3_bucket_acl" "s3-acl" {
  depends_on = [
    aws_s3_bucket_ownership_controls.s3-ownership,
    aws_s3_bucket_public_access_block.s3-public-access
  ]

  bucket = aws_s3_bucket.s3-static.id
  acl    = "public-read"
}

resource "aws_s3_bucket_object" "index" {
  bucket = aws_s3_bucket.s3-static.id
  key    = "index.html"
  source = "html_file/index.html"
  acl    = "public-read"
  content_type = "text/html"

}

resource "aws_s3_bucket_object" "error" {
  bucket = aws_s3_bucket.s3-static.id
  key    = "error.html"
  source = "html_file/error.html"
  acl    = "public-read"
  content_type = "text/html"
}

resource "aws_s3_bucket_object" "profile" {
  bucket = aws_s3_bucket.s3-static.id
  key    = "profile.png"
  source = "profile.png"
  acl    = "public-read"
}

resource "aws_s3_bucket_website_configuration" "example" {
  bucket = aws_s3_bucket.s3-static.id

  index_document {
    suffix = "index.html"
  }

  error_document {
    key = "error.html"
  }

  depends_on = [aws_s3_bucket_acl.s3-acl]
}