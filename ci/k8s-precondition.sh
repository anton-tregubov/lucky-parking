helm repo add ingress-nginx https://kubernetes.github.io/ingress-nginx
helm repo add jetstack https://charts.jetstack.io

helm repo update

helm uninstall --namespace cert-manager cert-manager || echo "cert-manager already uninstalled"
kubectl delete namespace cert-manager

helm uninstall --namespace ingress-nginx ingress-nginx || echo "ingress-nginx already uninstalled"
kubectl delete namespace ingress-nginx

helm install ingress-nginx ingress-nginx/ingress-nginx \
--namespace ingress-nginx \
--create-namespace
#--version v1.0.0

helm install cert-manager jetstack/cert-manager \
--namespace cert-manager \
--create-namespace  \
--set ingressShim.defaultIssuerName=letsencrypt \
--set ingressShim.defaultIssuerKind=Issuer \
--set ingressShim.defaultIssuerGroup=cert-manager.io \
--set installCRDs=true \
--version v1.5.3