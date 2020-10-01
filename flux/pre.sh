
KUBECTLVERSION=v1.19.0
KINDVERSION=v0.9.0
HELMFILEVERSION=v0.130.0
FLUXCTLVERSION=1.20.2
HELMVERSION=helm-v3.2.4

# https://kubernetes.io/zh/docs/tasks/tools/install-kubectl/
# curl -LO "https://storage.googleapis.com/kubernetes-release/release/$(curl -s https://storage.googleapis.com/kubernetes-release/release/stable.txt)/bin/linux/amd64/kubectl"
curl -sSL "https://storage.googleapis.com/kubernetes-release/release/${KUBECTLVERSION}/bin/linux/amd64/kubectl" -o /tmp/kubectl && \
chmod +x /tmp/kubectl && \
sudo mv /tmp/kubectl /usr/local/bin/kubectl

curl -Lo ./kind https://github.com/kubernetes-sigs/kind/releases/download/${KINDVERSION}/kind-linux-amd64 && \
  chmod +x ./kind && \
  mv ./kind /usr/local/bin/kind
  
wget https://github.com/roboll/helmfile/releases/download/${HELMFILEVERSION}/helmfile_linux_amd64 && \
  chmod +x helmfile_linux_amd64 && \
  mv helmfile_linux_amd64 /usr/local/bin/helmfile

wget https://github.com/fluxcd/flux/releases/download/${FLUXCTLVERSION}/fluxctl_linux_amd64   && \
  chmod +x fluxctl_linux_amd64 && \
  mv fluxctl_linux_amd64 /usr/local/bin/fluxctl
  
curl -sSL https://get.helm.sh/${HELMVERSION}-linux-amd64.tar.gz | \
    sudo tar xz -C /usr/local/bin --strip-components=1 linux-amd64/helm  