.PHONY: help init plan apply deploy destroy clean

ENV ?= production
TERRAFORM_DIR = terraform/environments/$(ENV)

help: ## Mostra esta mensagem de ajuda
	@echo "Comandos disponíveis:"
	@grep -E '^[a-zA-Z_-]+:.*?## .*$$' $(MAKEFILE_LIST) | awk 'BEGIN {FS = ":.*?## "}; {printf "  \033[36m%-15s\033[0m %s\n", $$1, $$2}'

init: ## Inicializa o Terraform
	cd $(TERRAFORM_DIR) && terraform init

plan: ## Mostra o plano de execução
	cd $(TERRAFORM_DIR) && terraform plan

apply: ## Aplica a infraestrutura
	cd $(TERRAFORM_DIR) && terraform apply

deploy: ## Deploy completo (infraestrutura + upload)
	./scripts/deploy.sh

destroy: ## Destroi toda a infraestrutura
	cd $(TERRAFORM_DIR) && terraform destroy

clean: ## Remove arquivos temporários
	find . -name ".terraform" -type d -exec rm -rf {} + 2>/dev/null || true
	find . -name "terraform.tfstate*" -type f -delete 2>/dev/null || true

output: ## Mostra os outputs do Terraform
	cd $(TERRAFORM_DIR) && terraform output
