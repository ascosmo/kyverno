# Repositório de Políticas Kyverno

Este repositório contém políticas do Kyverno para automação e governança de clusters Kubernetes.

## Políticas Incluídas

- **protect-ns-quota**: Bloqueia a criação de Namespaces e a edição de ResourceQuotas para usuários do grupo `GRP-USER`. Também protege o namespace do Kyverno.
- **protect-grp-projeto**: Restringe a criação de ClusterRoles e ClusterRoleBindings pelo grupo `GRP-USER`.
- **protect-terraform**: Protege recursos gerenciados via Terraform (com label `app: terraform`) de modificações manuais.

## Instalação do Kyverno

Para instalar o controlador do Kyverno via Helm:
```bash
helm repo add kyverno https://kyverno.github.io/kyverno/
helm install kyverno kyverno/kyverno -n kyverno --create-namespace
```

## Aplicação das Políticas

Para aplicar as políticas deste repositório:
```bash
kubectl apply -f cluster-policy-correto.yaml
kubectl apply -f cluster-policy01.yaml
kubectl apply -f terra/policy01.yaml
```

---
*Notas de Imagens (v1.15.2):*
- Background Controller
- Admission Controller (init: kyvernopre)
- Cleanup Controller
- Reports Controller
