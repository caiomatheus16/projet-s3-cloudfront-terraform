# 🚀 Site Estático com AWS S3 e CloudFront

## 📌 Sobre o Projeto

Site estático moderno e responsivo hospedado na AWS, demonstrando conhecimentos em:
- Cloud Computing (AWS)
- Infraestrutura como Código (Terraform)
- Frontend (HTML/CSS/JavaScript)
- DevOps (Deploy automatizado)

## 🏗️ Arquitetura

```
Usuário
   ↓
CloudFront (CDN Global)
   ↓
S3 Bucket (Hospedagem Estática)
   ↓
HTML + CSS + JavaScript
```

## 🛠️ Tecnologias

- **Frontend:** HTML5, CSS3, JavaScript (Vanilla)
- **Cloud:** AWS S3, AWS CloudFront
- **IaC:** Terraform
- **Versionamento:** Git/GitHub

## ✨ Features

- ✅ Design moderno com gradientes
- ✅ Animações suaves (CSS + JS)
- ✅ Totalmente responsivo
- ✅ HTTPS automático via CloudFront
- ✅ CDN global (baixa latência)
- ✅ Deploy automatizado

## 📊 Resultados

- **Performance:** CloudFront reduz latência em até 80%
- **Segurança:** HTTPS + proteção DDoS
- **Custo:** ~$0.50/mês para sites pequenos
- **Escalabilidade:** Suporta milhões de acessos

## 🚀 Como Executar

```bash
# 1. Configurar AWS
aws configure

# 2. Editar nome do bucket
# Edite terraform.tfvars

# 3. Deploy
terraform init
terraform apply

# 4. Upload dos arquivos
aws s3 cp index.html s3://seu-bucket/
aws s3 cp style.css s3://seu-bucket/
aws s3 cp script.js s3://seu-bucket/

# 5. Destruir (quando não precisar)
terraform destroy
```

## 📸 Screenshots

[Adicione aqui os prints do site funcionando]

## 🎯 Aprendizados

- Configuração de buckets S3 para hospedagem estática
- Distribuição de conteúdo com CloudFront
- Gerenciamento de infraestrutura com Terraform
- Políticas de acesso e segurança na AWS
- Otimização de performance com CDN

## 📝 Licença

MIT License - Projeto para fins educacionais e portfólio

---

**Desenvolvido por:** [Caio Matheus]
**Contato:** [Seu Email/LinkedIn]
