#!/bin/bash

set -e

ENV="${1:-production}"
TERRAFORM_DIR="terraform/environments/$ENV"
SRC_DIR="src"

if [ ! -d "$TERRAFORM_DIR" ]; then
    echo "❌ Ambiente '$ENV' não encontrado!"
    exit 1
fi

cd $TERRAFORM_DIR
BUCKET_NAME=$(terraform output -raw bucket_name 2>/dev/null)

if [ -z "$BUCKET_NAME" ]; then
    echo "❌ Bucket não encontrado. Execute o deploy primeiro!"
    exit 1
fi

cd ../../../

echo "📦 Fazendo upload dos arquivos para: $BUCKET_NAME"

aws s3 sync $SRC_DIR/ s3://$BUCKET_NAME/ \
    --exclude ".*" \
    --delete

echo "✅ Upload concluído!"
echo "🌐 Acesse: https://$(cd $TERRAFORM_DIR && terraform output -raw cloudfront_url | sed 's/https:\/\///')"
