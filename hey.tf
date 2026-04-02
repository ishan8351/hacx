provider "aws" {
  region = "us-east-1"
}

# VIOLATION: Missing server-side encryption and public access blocks
resource "aws_s3_bucket" "company_data" {
  bucket = "regradar-sensitive-company-data-123"
  
  tags = {
    Environment = "Production"
    DataClass   = "Confidential"
  }
}

# VIOLATION: Database is publicly accessible and missing encryption
resource "aws_db_instance" "main_db" {
  allocated_storage    = 20
  engine               = "postgres"
  instance_class       = "db.t3.micro"
  username             = "admin"
  password             = "password123" # Another violation right here!
  publicly_accessible  = true
  skip_final_snapshot  = true
}
