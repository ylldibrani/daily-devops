resource "kubernetes_namespace" "nodejs_ns" {
  metadata {
    annotations = {
      name = "nodejs"
    }

    labels = {
      environment = "test"
      app         = "nodejs"
    }

    name = "nodejs"
  }
}

resource "kubernetes_deployment" "nodejs_deployment" {
  metadata {
    name      = "node-app"
    namespace = kubernetes_namespace.nodejs_ns.metadata.0.annotations.name
    labels = {
      environment = "test"
      app         = "nodejs"
    }
  }

  spec {
    selector {
      match_labels = {
        environment = "test"
        app         = "nodejs"
      }
    }

    template {
      metadata {
        labels = {
          environment = "test"
          app         = "nodejs"
        }
      }

      spec {
        container {
          image = "ylldibrani/nodejs:1.0"
          name  = "node-app"
        }
      }
    }
  }
}

resource "kubernetes_service" "nodejs_service" {
  metadata {
    name = "node-app-service"
    namespace = "nodejs"
  }
  spec {
    selector = {
      environment = kubernetes_deployment.nodejs_deployment.metadata.0.labels.environment
      app = kubernetes_deployment.nodejs_deployment.metadata.0.labels.app
    }
    port {
      port        = 80
      target_port = 3000
    }

    type = "LoadBalancer"
  }
}