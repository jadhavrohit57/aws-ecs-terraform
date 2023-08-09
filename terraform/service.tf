resource "aws_ecs_service" "service" {
  name            = local.service_name                          # Naming our first service
  cluster         = aws_ecs_cluster.cluster.id                  # Referencing our created Cluster
  task_definition = aws_ecs_task_definition.task_definition.arn # Referencing the task our service will spin up
  launch_type     = "FARGATE"
  desired_count   = 1 # Setting the number of containers we want deployed to 1

  load_balancer {
    target_group_arn = aws_lb_target_group.target_group.arn # Referencing our target group
    container_name   = aws_ecs_task_definition.task_definition.family
    container_port   = 8080 # Specifying the container port
  }

  network_configuration {
    subnets = [
      aws_default_subnet.default_subnet_a.id,
      aws_default_subnet.default_subnet_b.id,
      aws_default_subnet.default_subnet_c.id
    ]
    assign_public_ip = true # Providing our containers with public IPs
    security_groups  = [aws_security_group.service_security_group.id]
  }

  depends_on = [
    aws_ecs_cluster.cluster
  ]

  lifecycle {
    ignore_changes = [
      task_definition
    ]
  }
}
