# 🚀 Terraform AWS S3 Infrastructure – Environnements Dev/Test/Prod

[![Deploy to AWS - DEV](https://github.com/vickydepicard/lab-terraform-aws-multi-env-s3/actions/workflows/deploy-dev.yml/badge.svg?branch=dev)](https://github.com/vickydepicard/lab-terraform-aws-multi-env-s3/actions/workflows/deploy-dev.yml)

[![Deploy to AWS - DEV](https://github.com/vickydepicard/lab-terraform-aws-multi-env-s3/actions/workflows/deploy-dev.yml/badge.svg?branch=test)](https://github.com/vickydepicard/lab-terraform-aws-multi-env-s3/actions/workflows/deploy-dev.yml)

[![Deploy to AWS - DEV](https://github.com/vickydepicard/lab-terraform-aws-multi-env-s3/actions/workflows/deploy-dev.yml/badge.svg?branch=main)](https://github.com/vickydepicard/lab-terraform-aws-multi-env-s3/actions/workflows/deploy-dev.yml)


Ce projet met en œuvre **Terraform** pour déployer dynamiquement des buckets **Amazon S3** pour trois environnements : `dev`, `test` et `prod`, avec une **architecture modulaire** et un pipeline **CI/CD GitHub Actions**.

---

## 📁 Structure du Projet

<img width="302" alt="image" src="https://github.com/user-attachments/assets/20be4a3d-31e6-484d-8e0f-3f40f627ad12" />

<img width="718" alt="image" src="https://github.com/user-attachments/assets/b7eec1c7-9746-46fe-98a0-e0053bcc2f03" />

<img width="918" alt="image" src="https://github.com/user-attachments/assets/28fd0062-d676-4e6a-a800-405df214b3a8" />



---

## 🎯 Objectifs

- Déployer un bucket S3 par environnement (`dev-lab-teraform-aws`, `test-lab-teraform-aws`, etc.)
- Centraliser la logique dans un **module Terraform réutilisable**
- Mettre en place des **pipelines GitHub Actions** pour chaque environnement
- Respecter les standards DevOps : modularité, sécurité, automatisation

---

## 🔧 Pré-requis

- [Terraform CLI](https://developer.hashicorp.com/terraform/downloads)
- Compte AWS (avec accès S3)
- Clés AWS configurées sur GitHub Actions :
  - `AWS_ACCESS_KEY_ID`
  - `AWS_SECRET_ACCESS_KEY`

---

## 🚀 Déploiement manuel (local)

```bash
cd envs/dev
terraform init
terraform apply -var-file="terraform.tfvars"


## 🔧 Pré-requis

- Terraform CLI
- Compte AWS avec clés d’accès
- AWS CLI configuré (`aws configure`)

## 🚀 Déploiement manuel

```bash
cd envs/dev
terraform init
terraform apply


🛠️ Le Module S3
Ce module permet de créer un bucket Amazon S3 avec des tags et noms dynamiques.

Entrées :
Variable	Description	Exemple
environment	Environnement ciblé	dev, test, prod
bucket_suffix	Suffixe ajouté au nom du bucket	lab-teraform-aws


🔄 CI/CD – GitHub Actions
Chaque push sur une branche (main, test, prod) déclenche le workflow correspondant :

main → déploie sur dev

test → déploie sur test

prod → déploie sur prod

.github/workflows/
├── deploy-dev.yml
├── deploy-test.yml
└── deploy-prod.yml


🔐 Sécurité
Aucun secret n’est versionné

Les fichiers .tfstate sont ignorés via .gitignore

Utilisation de GitHub Secrets pour les identifiants AWS

Pas de variables sensibles en dur

🧠 Bonnes pratiques mises en œuvre
✅ Modularité Terraform
✅ Nomination dynamique des buckets
✅ Pipelines CI/CD propres par environnement
✅ Séparation claire entre code partagé et spécifique à chaque env
✅ Documentation claire et structurée

👩🏽‍💻 Auteur
Hen Hotio De Picard
Ingénieure DevOps & QA | Automatisation CI/CD | Cloud AWS
📧 Contact sur GitHub

📜 Licence
MIT – Utilisation libre à des fins d’apprentissage ou d’entreprise.
