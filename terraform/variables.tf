locals {
  aws_region                    = "ap-south-1"
  service_name                  = "testorg-backend-dev"
  load_balancer_name            = "testorg-backend-dev-lb"
  cluster_name                  = "testorg-backend-dev-cluster"
  service_security_group_name   = "testorg-backend-dev-sg"
  target_group_name             = "testorg-backend-dev-tg"
  task_definition_name          = "testorg-backend-dev-task-definition"
}
