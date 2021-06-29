//provider "kubernetes" {
//  config_path = ""
//}
//
//variable "app" {
//  default = "demo-app"
//}
//
//variable "image" {
//  image = ""
//}
//
//variable "container_port" {
//  default = "8080"
//}
//
//resource "kubernetes_deployment" "app" {
//  metadata {
//    name = "${var.prefix}-demo-app"
//    labels = {
//      app = "${var.prefix}-demo-app"
//    }
//  }
//  spec {
//    replicas = 3
//
//    selector {
//      match_labels = {
//        app = "${var.prefix}-demo-app"
//      }
//    }
//
//    template {
//      metadata {
//        labels = {
//          app = "${var.prefix}-demo-app"
//        }
//      }
//      spec {
//        container {
//          image = var.image
//          name = "${var.prefix}-demo-app"
//          port {
//            name = "http"
//            container_port = var.container_port
//          }
//        }
//      }
//    }
//  }
//}
//
//resource "kubernetes_service" "app" {
//
//  metadata {
//    name = var.app
//  }
//  spec {
//    selector = {
//      app = kubernetes_deployment.app.metadata.0.labels.app
//    }
//    port {
//      port = 80
//      target_port = var.container_port
//    }
//    type = "LoadBalancer"
//  }
//}
//
//output "endpoint" {
////  value = kubernetes_service.app.status.0.load_balancer.0.ingress.0.ip
//  value = kubernetes_service.app
//}
