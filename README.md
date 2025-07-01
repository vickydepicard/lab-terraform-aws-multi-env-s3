# 🚀 Terraform AWS S3 Bucket Infrastructure - Environnements Dev/Test/Prod

Ce projet utilise **Terraform** pour provisionner des buckets S3 AWS dans trois environnements distincts : `dev`, `test`, et `prod`.

## 📁 Structure du projet

lab-terraform-aws/
├── modules/
│ └── s3_bucket/
│ ├── main.tf
│ ├── variables.tf
│ ├── outputs.tf
├── envs/
│ ├── dev/
│ │ ├── main.tf
│ │ ├── variables.tf
│ │ ├── terraform.tfvars
│ ├── test/
│ ├── prod/


## 🎯 Objectifs

- Provisionner des buckets S3 nommés automatiquement par environnement (`dev-kolux-backup`, `test-kolux-backup`, etc.)
- Respecter les bonnes pratiques Terraform (modularité, réutilisabilité)
- Utiliser un pipeline GitHub Actions pour l'automatisation

## 🔧 Pré-requis

- Terraform CLI
- Compte AWS avec clés d’accès
- AWS CLI configuré (`aws configure`)

## 🚀 Déploiement manuel

```bash
cd envs/dev
terraform init
terraform apply


🛠️ Module S3
Le module s3_bucket permet de créer un bucket nommé selon l’environnement + suffixe.

Variables :

environment : nom de l’environnement (dev/test/prod)

bucket_suffix : suffixe du bucket

🔄 CI/CD avec GitHub Actions
Une action GitHub est utilisée pour valider et provisionner automatiquement.

➡️ Voir .github/workflows/terraform.yml

🔐 Sécurité
Les fichiers .tfstate sont ignorés par Git

Pas de variables sensibles en dur

Made with ❤️ by DevOps Engineer  Hen Hotio De Picard


---

# 🧱 Étape 2 — Ajouter un pipeline GitHub Actions CI/CD

## 📁 Créer le dossier workflow :

```bash
mkdir -p .github/workflows

name: Terraform AWS S3

on:
  push:
    paths:
      - 'envs/dev/**'
      - 'modules/s3_bucket/**'
      - '.github/workflows/terraform.yml'

jobs:
  terraform:
    name: 'Terraform Plan & Apply (Dev)'
    runs-on: ubuntu-latest

    env:
      AWS_REGION: us-east-1

    steps:
      - name: Checkout code
        uses: actions/checkout@v4

      - name: Setup Terraform
        uses: hashicorp/setup-terraform@v3
        with:
          terraform_version: 1.6.6

      - name: Configure AWS credentials
        uses: aws-actions/configure-aws-credentials@v4
        with:
          aws-access-key-id: ${{ secrets.AWS_ACCESS_KEY_ID }}
          aws-secret-access-key: ${{ secrets.AWS_SECRET_ACCESS_KEY }}
          aws-region: us-east-1

      - name: Terraform Init
        working-directory: ./envs/dev
        run: terraform init

      - name: Terraform Format Check
        working-directory: ./envs/dev
        run: terraform fmt -check

      - name: Terraform Plan
        working-directory: ./envs/dev
        run: terraform plan -var-file="terraform.tfvars"

      - name: Terraform Apply (auto-approve)
        working-directory: ./envs/dev
        run: terraform apply -auto-approve -var-file="terraform.tfvars"


🔐 Tu devras ajouter tes clés AWS dans les GitHub Secrets :

AWS_ACCESS_KEY_ID

AWS_SECRET_ACCESS_KEY
