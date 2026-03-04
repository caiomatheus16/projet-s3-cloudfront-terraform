# Site Estático AWS - S3 + CloudFront

Site estático hospedado na AWS com S3 e CloudFront usando Terraform.

## 🚀 Recursos

- CloudFront CDN para distribuição global
- HTTPS automático
- Infraestrutura modular com Terraform
- Deploy automatizado com GitHub Actions
- CI/CD pipeline

## 📋 Pré-requisitos

- AWS CLI configurado
- Terraform >= 1.0
- Credenciais AWS

## 🛠️ Deploy Rápido

```bash
# 1. Configure o bucket
cd terraform/environments/production
cp terraform.tfvars.example terraform.tfvars
# Edite terraform.tfvars com seu bucket name único

# 2. Deploy
cd ../../..
./scripts/deploy.sh
```

## 🔄 CI/CD com GitHub Actions

### Configuração

1. Adicione as secrets no GitHub:
   - `AWS_ACCESS_KEY_ID`
   - `AWS_SECRET_ACCESS_KEY`

2. Push para `main` dispara deploy automático
3. Pull Requests executam validação do Terraform

### Workflows

- **Deploy**: Executa em push para `main`
- **Validate**: Executa em Pull Requests

## 📁 Estrutura

```
├── .github/workflows/   # CI/CD pipelines
├── src/                 # Código do site
├── terraform/           # Infraestrutura
│   ├── modules/        # Módulos reutilizáveis
│   └── environments/   # Configurações por ambiente
└── scripts/            # Scripts de automação
```

## 💰 Custos

- S3: ~$0.023/GB
- CloudFront: 1TB grátis/mês (primeiro ano)
- Estimativa: < $1/mês

## 🧹 Limpar

```bash
cd terraform/environments/production
terraform destroy
```
