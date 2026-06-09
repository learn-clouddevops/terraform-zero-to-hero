resource "aws_s3_bucket" "bucket_main"{
    bucket = var.bucket_name


    lifecycle {

    prevent_destroy = true

  }
}



resource "aws_s3_bucket_versioning" "bucket_main_version" {
    bucket = aws_s3_bucket.bucket_main.id
    versioning_configuration {
    status = "Enabled"
  }
}

resource "aws_s3_bucket_server_side_encryption_configuration" "bucket_main_sse" {

  bucket = aws_s3_bucket.bucket_main.id

  rule {

    apply_server_side_encryption_by_default {

      sse_algorithm = "AES256"

    }

  }

}
resource "aws_s3_bucket_public_access_block" "bucket_main_public_access_block" {

  bucket = aws_s3_bucket.bucket_main.id

  block_public_acls       = true

  block_public_policy     = true

  ignore_public_acls      = true

  restrict_public_buckets = true

}