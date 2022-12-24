/*
resource "kubernetes_namespace" "ingress" {
    metadata {
      annotations = {
        name = "nginx-ingress"
      }
      labels = {
        mylabel = "nginx-ingress"
      }
      name = "nginx-ingress"
    }
}
*/