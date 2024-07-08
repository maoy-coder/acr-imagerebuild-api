build-api:
	docker buildx build -t pxv-acr-demo:latest .

run:
	docker run -p 5000:5000 pxv-acr-demo:latest

run-acr:
	docker run -p 5000:5000 --pull always pxvacriadd.azurecr.io/pxv-acr-demo:latest

acr-build-api:
	az acr build --resource-group phlex-acr-dev-iadd --registry pxvacriadd -t pxv-acr-demo:latest .

acr-list-runs:
	az acr task list-runs --registry pxvacriadd -o table

acr-create-task:
	az acr task create --name acr-pxv-acr-demo-base-image-updated --registry pxvacriadd --image pxvacriadd.azurecr.io/pxv-acr-demo:latest --base-image-trigger-enabled true --commit-trigger-enabled false --context https://github.com/maoy-coder/acr-imagerebuild-api.git --file Dockerfile --base-image-trigger-type All --no-cache true --schedule "*/5 * * * *"