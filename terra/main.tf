#providers
terraform {
  required_providers {
    kubectl = {
      source = "gavinbunney/kubectl"
    }
    helm = {
      source = "hashicorp/helm"
    }
    kubernetes = {
      source = "hashicorp/kubernetes"
    }
  }
}

#conexao helm com cluster
provider "helm" {
  kubernetes = {
    config_path = "~/.kube/config"
  }
}

#cria namespace
#resource "kubernetes_namespace" "name" {
#  metadata {
#    name = "kyverno"
#  }
#}

resource "helm_release" "kyverno" {
  name       = "kyverno"
  repository = "https://kyverno.github.io/kyverno/"
  chart      = "kyverno"
  version    = "3.5.2"
  namespace  = "kyverno"
  create_namespace = true
  wait             = true
  wait_for_jobs    = true
}

#conectando no cluster
provider "kubernetes" {
  config_path    = "~/.kube/config"
  config_context = "minikube"
}

#Chamando yaml
resource "kubectl_manifest" "policy01" {
  yaml_body = file("${path.module}/policy01.yaml")
  depends_on = [ 
    helm_release.kyverno ]
}
