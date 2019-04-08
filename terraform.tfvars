# NETWORK
region           = "us-east-1"

# TAGS
tags = {
    Division     = "Infra"
    Environment  = "QA"
    Management   = "Terraform"
    Project      = "forgerock"
    MonitorType  = "New Relic"
}

dj_instance_size = "t2.micro"

dj_dns           = "AWSLOPENDJQxx"
subnet_id		 = "subnet-xxxx"
env_name		 = "forgerock"
iam_role		 = "S3-Admin-Full-Access"
subnet_id		 = "subnet-xxx"
sg_id 			 = "sg-xxxxx"
private_key		 = "/path/to/forgerock_key.pem"
