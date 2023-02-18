region_name = "us-east-2"
vpc_name = "comcast_vpc"
vpc_cidr_block = "10.10.0.0/16"
vpc_azs = ["us-east-2a", "us-east-2b"]
vpc_private_subnets = ["10.10.1.0/24"]
vpc_public_subnets = ["10.10.151.0/24", "10.10.152.0/24"]
route = ["0.0.0.0/0"]
keypair_name = "comcast_key"
