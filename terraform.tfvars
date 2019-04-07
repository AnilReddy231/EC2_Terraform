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

dj_dns           = "AWSLOPENDJQ01"
security_group_id = "sg-0848ac2b7286548d5"
subnet_id		 = "subnet-0ee1104ef2e954b91"
env_name		 = "forgerock"
iam_role		 = "S3-Admin-Full-Access"
subnet_id		 = "subnet-0ee1104ef2e954b91"
sg_id 			 = "sg-0848ac2b7286548d5"
private_key		 = "/Users/anilreddy/Downloads/SSHKeyPair/forgerock_key.pem"