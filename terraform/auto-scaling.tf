#####
# Auto Scaling
#####
resource "aws_appautoscaling_target" "auto_scaling_target" {
  max_capacity       = 2
  min_capacity       = 1
  resource_id        = "service/${local.cluster_name}/${local.service_name}"
  scalable_dimension = "ecs:service:DesiredCount"
  service_namespace  = "ecs"
  depends_on = [
    aws_ecs_cluster.cluster,
    aws_ecs_service.service
  ]
}

resource "aws_appautoscaling_policy" "memory_auto_scaling_policy" {
  name               = "${local.service_name}-memory-auto-scaling-policy"
  policy_type        = "TargetTrackingScaling"
  resource_id        = aws_appautoscaling_target.auto_scaling_target.resource_id
  scalable_dimension = aws_appautoscaling_target.auto_scaling_target.scalable_dimension
  service_namespace  = aws_appautoscaling_target.auto_scaling_target.service_namespace

  target_tracking_scaling_policy_configuration {
    predefined_metric_specification {
      predefined_metric_type = "ECSServiceAverageMemoryUtilization"
    }

    target_value = 80
  }
}

resource "aws_appautoscaling_policy" "cpu_auto_scaling_policy" {
  name               = "${local.service_name}-cpu-auto-scaling-policy"
  policy_type        = "TargetTrackingScaling"
  resource_id        = aws_appautoscaling_target.auto_scaling_target.resource_id
  scalable_dimension = aws_appautoscaling_target.auto_scaling_target.scalable_dimension
  service_namespace  = aws_appautoscaling_target.auto_scaling_target.service_namespace

  target_tracking_scaling_policy_configuration {
    predefined_metric_specification {
      predefined_metric_type = "ECSServiceAverageCPUUtilization"
    }

    target_value = 60
  }
}
