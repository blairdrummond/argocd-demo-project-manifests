ifeq (, $(shell which yq))
YQ := cat
else
YQ := yq -P e -
endif

preview:
	kubectl kustomize | $(YQ)
