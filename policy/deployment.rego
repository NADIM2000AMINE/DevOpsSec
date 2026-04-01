package main

# Cette règle bloque le déploiement si runAsNonRoot n'est pas défini à "true"
deny[msg] {
  input.kind == "Deployment"
  not input.spec.template.spec.securityContext.runAsNonRoot == true
  msg := "Securité : Le conteneur ne doit pas s'exécuter en tant que root. Ajoutez 'securityContext.runAsNonRoot: true' dans votre k8s.yaml."
}