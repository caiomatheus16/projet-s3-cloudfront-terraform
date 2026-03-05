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

## 🛠️ Deploy da Infraestrutura (Local)

```bash
# 1. Configure o bucket
cd terraform/environments/production
cp terraform.tfvars.example terraform.tfvars
# Edite terraform.tfvars com seu bucket name único

# 2. Provisione a infraestrutura
terraform init
terraform apply
```

## 🔄 CI/CD com GitHub Actions

### Configuração

1. Provisione a infraestrutura localmente (acima)
2. Adicione as secrets no GitHub:
   - `AWS_ACCESS_KEY_ID`
   - `AWS_SECRET_ACCESS_KEY`
3. Faça alterações no código em `src/`
4. Push para `main` → Deploy automático!

### Workflows

- **Deploy**: Upload automático de arquivos do `src/` para S3
- **Terraform Validate**: Valida mudanças no Terraform

### Como funciona

```bash
# Altere o código do site
vim src/index.html

# Commit e push
git add src/
git commit -m "feat: atualiza homepage"
git push origin main

# GitHub Actions faz:
# ✅ Upload para S3
# ✅ Invalida cache do CloudFront
```

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
