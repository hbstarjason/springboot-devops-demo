CLUSTER_NAME := fluxdemo
OUTPUT_DIR := output
KUBECONFIG := $(OUTPUT_DIR)/kubeconfig.yaml
export KUBECONFIG

.PHONY: all
all: cluster

.PHONY: check
check:
	docker version
	kind version
	kubectl version --client
	helmfile --version
	fluxctl version

.PHONY: cluster
cluster:
	kind create cluster --name $(CLUSTER_NAME) --config cluster.yaml
	helmfile sync
	kubectl apply -f springboot-devops-demo.yaml
	kubectl  rollout status deployment springboot-devops-demo

.PHONY: logs-flux
logs-flux:
	kubectl logs -f -lapp=flux

.PHONY: delete-cluster
delete-cluster:
	kind delete cluster --name $(CLUSTER_NAME)
	-rm $(KUBECONFIG)
