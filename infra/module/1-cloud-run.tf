#resource "google_cloud_run_service" "default" {
#  name     = "agent-santa-service"
#  location = "us-east1"
#
#  template {
#    spec {
#      containers {
#        image = "docker.io/jbhv12/agent-santa:latest"
#        ports {
#          container_port = 1225
#        }
#        env {
#          name  = "CHAINLIT_AUTH_SECRET"
#          value = var.chainlit_auth_secret
#        }
#        env {
#          name  = "AWS_COGNITO_USER_POOL_ID"
#          value = aws_cognito_user_pool.my_user_pool.id
#        }
#        env {
#          name  = "AWS_COGNITO_CLIENT_ID"
#          value = aws_cognito_user_pool_client.client.id
#        }
#        env {
#          name  = "AWS_ACCESS_KEY_ID"
#          value = var.aws_access_key_id
#        }
#        env {
#          name  = "AWS_SECRET_ACCESS_KEY"
#          value = var.aws_secret_access_key
#        }
#        env {
#          name  = "OPENAI_API_KEY"
#          value = var.openai_api_key
#        }
#        # Optional: Adjust CPU and memory allocations for cost optimization
##        resources {
##          limits = {
##            cpu    = "500m"  # 0.5 vCPUs, adjust as needed
##            memory = "256Mi" # 256 MB, adjust as needed
##          }
##        }
#      }
#
#      # Set the maximum number of instances to 1 for cost saving
##      container_concurrency = 80  # Adjust as needed for your application
#    }
#  }
#
#  traffic {
#    percent         = 100
#    latest_revision = true
#  }
#}
#
#
## IAM policy to make the service public
#resource "google_cloud_run_service_iam_policy" "public" {
#  location    = google_cloud_run_service.default.location
#  project     = google_cloud_run_service.default.project
#  service     = google_cloud_run_service.default.name
#
#  policy_data = <<EOF
#  {
#    "bindings": [
#      {
#        "role": "roles/run.invoker",
#        "members": [
#          "allUsers"
#        ]
#      }
#    ]
#  }
#  EOF
#}
#
#
#