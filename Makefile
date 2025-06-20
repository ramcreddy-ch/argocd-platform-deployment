.PHONY: help deploy projects apps status

help:
	@echo "Platform Engineering CLI"
	@echo "  deploy   - Install ArgoCD and CRDs"
	@echo "  projects - Synchronize all AppProjects"
	@echo "  apps     - Synchronize all Applications"
	@echo "  status   - Check AgroCD health"

deploy:
	kubectl create namespace argocd || true
	kubectl apply -n argocd -f https://raw.githubusercontent.com/argoproj/argo-cd/stable/manifests/install.yaml

projects:
	kubectl apply -f projects/

apps:
	kubectl apply -f applications/

status:
	kubectl get pods -n argocd
