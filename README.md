# Projet DevSecOps - Pipeline CI/CD Sécurisé

## Objectif du Projet
Il s'agit de la mise en place d'un pipeline de DevSecOps contribuant à la sécurisation du code d'un projet en utilisant GitHub Actions. L'objectif est d'intégrer la sécurité directement dans le cycle de développement (approche "Shift-Left").

## Outils Utilisés
Les technologies et outils suivants ont été mis en place dans ce projet:
* **CI/CD :** GitHub Actions 
* **Linting YAML & Dockerfile :** Action `yamllint` et `hadolint`
* **Scan de vulnérabilités (Dépendances) :** Trivy (mode FS)
* **Scan d'image Docker :** Trivy (Container scan)
* **Policy-as-Code (Kubernetes) :** Conftest (langage Rego)

## Structure du Dépôt
* `.github/workflows/ci.yml` : Le pipeline CI/CD complet.
* `policy/deployment.rego` : La règle de sécurité Conftest interdisant le mode "root".
* `app.py` & `requirements.txt` : Une petite API en Python/Flask servant d'application de test.
* `Dockerfile` : Les instructions pour conteneuriser l'application.
* `k8s.yaml` : Le manifeste de déploiement Kubernetes sécurisé.

## Fonctionnement du Pipeline
À chaque `push` sur la branche `main`, le pipeline effectue les actions suivantes :
1. Vérification de la syntaxe des fichiers de configuration (Linting).
2. Scan de sécurité des dépendances Python via Trivy.
3. Build de l'image Docker de l'application.
4. Scan de sécurité du système d'exploitation de l'image Docker via Trivy.
5. Vérification des politiques de sécurité du fichier Kubernetes via Conftest (blocage si `runAsNonRoot` n'est pas activé).