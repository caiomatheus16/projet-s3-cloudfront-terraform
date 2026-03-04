# Módulo S3 + CloudFront

Módulo Terraform reutilizável para criar um site estático com S3 e CloudFront.

## Uso

```hcl
module "website" {
  source = "../../modules/s3-cloudfront"

  bucket_name = "meu-site-unico"
}
```

## Inputs

| Nome | Descrição | Tipo | Obrigatório |
|------|-----------|------|-------------|
| bucket_name | Nome único do bucket S3 | string | Sim |

## Outputs

| Nome | Descrição |
|------|-----------|
| website_url | URL do website S3 |
| cloudfront_url | URL do CloudFront |
| bucket_name | Nome do bucket criado |

## Recursos Criados

- S3 Bucket com configuração de website
- S3 Bucket Policy para acesso público
- CloudFront Distribution
- Configuração de cache otimizada
