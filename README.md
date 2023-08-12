* Needs public subnet for creation
    * Need to check how this would work in case of private subnets
* Create a SG with the SSH port open to your IP for accessing nodes
    * Use this SG in the node creation config to avoid it creating a default SG with ports open for all
* Update the main.tf with the exit IP of your machine for the eks cluster resource to avoid the public eks cluster endpoint from being open to all
* Use Checkov scanning to understand any security vulnerabilities



## Issues faced ##
1. NodeCreationFailure: Instances failed to join the kubernetes cluster
    * The nodes are in public subnet and has a public IP attached to it
    * Opening the public endpoint of the EKS to the public IP of the instance made it work
2. To import the AWS auth config map
    * https://devpress.csdn.net/k8s/62ebf60789d9027116a0fd7a.html
    * Note: Do a terraform apply partially before doing import