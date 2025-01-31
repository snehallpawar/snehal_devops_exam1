# Declare your private subnet
resource "aws_subnet" "private_subnet" {
  vpc_id            = data.aws_vpc.vpc.id
  cidr_block        = "10.0.3.0/24"
  availability_zone = "ap-south-1a"
  map_public_ip_on_launch = false
}

# Define your routing table
resource "aws_route_table" "private_route_table" {
  vpc_id = data.aws_vpc.vpc.id
}

resource "aws_route" "private_route" {
  route_table_id         = aws_route_table.private_route_table.id
  destination_cidr_block = "0.0.0.0/0"
  nat_gateway_id         = "nat-0a34a8efd5e420945"  # Replace with your actual NAT Gateway ID
}

resource "aws_lambda_function" "my_lambda" {
  function_name = "MyLambdaFunction"
  handler       = "index.handler"
  runtime       = "python3.8"
  role          = "arn:aws:iam::168009530589:role/DevOps-Candidate-Lambda-Role"
  filename      = "lambda_function.zip"  # Path relative to the root of your repository
  source_code_hash = filebase64sha256("lambda_function.zip")  # Ensure this is correct
  timeout        = 3
}



output "private_subnet_id" {
  value = aws_subnet.private_subnet.id
}
