# First time setup

Open the `kustomization.yaml` file, and change every occurance of `autobots` to your namespace name.

Run `make preview` or `kustomize build .` to preview the content here. You can install `kustomize` from [the releases](https://github.com/kubernetes-sigs/kustomize/releases) or with brew. 

## What is Kustomize?

Kustomize is a way to combine, merge, and patch Kubernetes yaml; it's an official [`kubernetes-sigs` project](https://github.com/kubernetes-sigs/kustomize). The best reference on kustomize is [the official reference guide](https://kubectl.docs.kubernetes.io/references/kustomize/kustomization/).

# Intended layout

The intended breakdown is `/<project>/<environment>/<application yamls>`. The `kustomization.yaml` files merge together the different resources and apply labels and patches (e.g. configuring the destination cluster & namespace, auto-sync policies, etc)

```
.
|- project1/
|  |- dev/*
|  |- prod/*
|  \- kustomization.yaml
|
|- project2/
|  |- dev/*
|  |- prod/*
|  \- kustomization.yaml
|
\- kustomization.yaml
```

The kustomization file will have many labels, patches, etc, but probably the first thing you'll want to do is look at the `resources:` block in the kustomization files. A resource can be:

1. A folder with another `kustomization.yaml` file.
2. A yaml file
3. A Url to a yaml file.

Kustomize is simplest when everything is "top-down", but if you need-to/want-to use a resource in a directory above you (i.e. `../folder`), you'll need to run `kustomize` with [a special flag](https://kubectl.docs.kubernetes.io/faq/kustomize/#security-file-foo-is-not-in-or-below-bar)

# Intended use

This repo is designed with the intention of being a target of an ArgoCD Application. So, we're not applying this manually or with a github action in most circumstances, we're letting ArgoCD automatically apply the content found here.
