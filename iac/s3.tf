resource "aws_s3_bucket" "datalake" {

  bucket = "${var.bbucket_name}-${var.ambiente}-${var.nr_conta}"

  tags = {
    "IES"   = "IGTI",
    "CURSO" = "EDC"
  }

}

resource "aws_s3_bucket_acl" "datalake_acl" {
  bucket = aws_s3_bucket.datalake.id
  acl    = "private"
}

resource "aws_s3_bucket_server_side_encryption_configuration" "datalake_encryption" {
  bucket = aws_s3_bucket.datalake.id

  rule {
    apply_server_side_encryption_by_default {
      sse_algorithm = "AES256"
    }
  }
}