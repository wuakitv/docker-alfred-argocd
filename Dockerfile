FROM alpine:3.11

ENV ARGOCD_SERVER=argocd.wuaki.org

RUN apk add --no-cache --update curl

RUN curl -sSL -o /usr/local/bin/argocd https://${ARGOCD_SERVER}/download/argocd-linux-amd64 && \
chmod +x /usr/local/bin/argocd

# Execute main Shell script
ADD start.sh   /
RUN chmod +x /start.sh
