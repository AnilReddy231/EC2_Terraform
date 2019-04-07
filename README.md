# EC2_Terraform

## Provisions an EC2 instance followed by installs &amp; Configures OpenDJ using User_Data

![alt text](https://github.com/AnilReddy231/EC2_Terraform/blob/master/graph.png)

* ___Terraform is using S3 bucket to maintain it's state information and loading AWS credentials from the local credentials file.___

* ___Used Terraform Graph to show you how the provisioned services are being linked one another. Below are the commands you can use to generate graph.___

  * ___terraform graph [DIR or Plan] | dot -Tpng >> graph.png___ 

  * ___if *dot* is not available, Please install it graphviz as follows:___

  * ___brew install graphviz ( on Mac )___
