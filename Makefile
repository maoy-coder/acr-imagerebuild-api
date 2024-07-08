build-api:
	docker buildx build -t pxv-acr-demo:latest .

run:
	docker run -p 5000:5000 pxv-acr-demo:latest

run-acr:
	docker run -p 5000:5000 pxvacriadd.azurecr.io/pxv-acr-demo:latest

acr-build-api:
	az acr build --resource-group phlex-acr-dev-iadd --registry pxvacriadd -t pxv-acr-demo:latest .

acr-list-runs:
	az acr task list-runs --registry pxvacriadd -o table

acr-create-task:
	az acr task create --name base-image-updated --registry pxvacriadd --image pxv-acr-demo:latest --base-image-trigger-enabled true --commit-trigger-enabled false