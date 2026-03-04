#!/bin/bash

set -e

ENV="production"
TERRAFORM_DIR="terraform/environments/$ENV"
SRC_DIR="src"

echo "🚀 Iniciando deploy do ambiente: $ENV"

cd $TERRAFORM_DIR

terraform init
terraform plan
terraform apply -auto-approve

BUCKET_NAME=$(terraform output -raw bucket_name)

echo "📦 Fazendo upload dos arquivos..."
cd ../../../
aws s3 cp $SRC_DIR/index.html s3://$BUCKET_NAME/
aws s3 cp $SRC_DIR/assets/css/style.css s3://$BUCKET_NAME/
aws s3 cp $SRC_DIR/assets/js/script.js s3://$BUCKET_NAME/

echo "✅ Deploy concluído!"
cd $TERRAFORM_DIR
terraform output
