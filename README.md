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

# For deploying test node application from LOCAL machine
    * edit the "deployment.sh" file 
        - add all the required varaible values
        - then run the file with "./deployment.sh"

# Also node application can be deployed using CICD pipeline (github action workflow)
    * add all the required "env" variable values in ".github/workflows/deployment.yml" file
    * then push code to main branch by un-commenting the "on" trigger from file
        - then github will take care of the deployment
