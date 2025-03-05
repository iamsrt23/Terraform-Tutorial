resource "aws_s3_bucket" "Mybucket0" {
  bucket = "terraform2503050"

  tags = {
    Name        = "Mybucket0 "
    Environment = "Dev"
  }
  depends_on = [aws_route_table_association.day2-RTA]
}


resource "aws_s3_bucket" "Mybucket1" {
  bucket = "terraform2503051"

  tags = {
    Name        = "Mybucket0 "
    Environment = "Dev"
  }
  depends_on = [aws_s3_bucket.Mybucket0]
}

resource "aws_s3_bucket" "Mybucket2" {
  bucket = "terraform2503052"

  tags = {
    Name        = "Mybucket0 "
    Environment = "Dev"
  }
  depends_on = [aws_s3_bucket.Mybucket1]
}