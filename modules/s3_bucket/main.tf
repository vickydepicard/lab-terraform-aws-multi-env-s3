resource "aws_s3_bucket" "this" {
  bucket = "${var.environment}-${var.bucket_suffix}"

  tags = {
    Name        = "${var.environment}-${var.bucket_suffix}"
    Environment = var.environment
  }
}

