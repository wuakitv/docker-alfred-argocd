FROM alpine:3.11

ENV ARGOCD_VERSION=v1.3.6

RUN apk add --no-cache --update curl

RUN curl -sSL -o /usr/local/bin/argocd https://github.com/argoproj/argo-cd/releases/download/$ARGOCD_VERSION/argocd-linux-amd64 && \
chmod +x /usr/local/bin/argocd

# Execute main Shell script
ADD start.sh   /
RUN chmod +x /start.sh
