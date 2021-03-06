FROM alpine:3.11

ENV ARGOCD_VERSION=v1.5.2

RUN apk add --no-cache --update curl

RUN curl -sSL -o /usr/local/bin/argocd https://github.com/argoproj/argo-cd/releases/download/$ARGOCD_VERSION/argocd-linux-amd64 && \
chmod +x /usr/local/bin/argocd

ADD start.sh   /
RUN chmod +x /start.sh
