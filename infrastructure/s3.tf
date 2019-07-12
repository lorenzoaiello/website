resource "aws_s3_bucket" "website" {
  bucket = "lorenzoaiello-website"
  acl    = "private"
  policy = data.aws_iam_policy_document.s3_policy.json

  website {
    index_document = "index.html"
    error_document = "404.html"
  }
}

data "aws_iam_policy_document" "s3_policy" {
  statement {
    actions   = ["s3:GetObject"]
    resources = ["arn:aws:s3:::lorenzoaiello-website/*"]

    principals {
      type        = "AWS"
      identifiers = [aws_cloudfront_origin_access_identity.origin_access_identity.iam_arn]
    }
  }

  statement {
    actions   = ["s3:ListBucket"]
    resources = ["arn:aws:s3:::lorenzoaiello-website"]

    principals {
      type        = "AWS"
      identifiers = [aws_cloudfront_origin_access_identity.origin_access_identity.iam_arn]
    }
  }
}
