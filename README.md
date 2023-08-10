# aws-ecs-terraform


# For creeting AWS fargate services use terroform
    * first create an S3 bukcet with name "testorg-terraform-state" for saving terraform states
    * then cd inside terraform directory and run following commands serially
        -   terraform init
        -   terraform validate
        -   terraform plan
        -   terraform apply

    * To delete all the created service run following command
        -   terraform destroy

# For deploying test node application
    * edit the "deployment.sh" file 
        - add all the required varaible values
        - then run the file with "./deployment.sh"

