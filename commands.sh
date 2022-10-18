# ami-011c971da0e71c495
KUBERNETES_VERSION="1.22/stable"
CHANNEL="1.6/stable"

for snap in juju juju-wait charmcraft; do sudo snap install $snap --classic; done
sudo snap install microk8s --classic --channel=${KUBERNETES_VERSION}
sudo snap refresh charmcraft --channel latest/candidate
sudo usermod -a -G microk8s ubuntu
sudo su $USER

microk8s enable dns storage metallb:"10.64.140.43-10.64.140.49,192.168.0.105-192.168.0.111"
alias kubectl="microk8s.kubectl"
kubectl wait --for=condition=available -nkube-system deployment/coredns deployment/hostpath-provisioner
kubectl -n kube-system rollout status ds/calico-node

juju bootstrap microk8s uk8s-controller
juju add-model kubeflow
juju deploy kubeflow --channel=${CHANNEL} --trust

USERNAME="user123@email.com"; PASSWORD="user123"; juju config dex-auth public-url=http://10.64.140.43.nip.io; juju config oidc-gatekeeper public-url=http://10.64.140.43.nip.io; juju config dex-auth static-username=${USERNAME}; juju config dex-auth static-password=${PASSWORD}
juju run --unit istio-pilot/0 -- "export JUJU_DISPATCH_PATH=hooks/config-changed; ./dispatch" # bug here https://github.com/canonical/istio-operators/issues/113
nice -n 16 watch -n 1 -c juju status --relations --color