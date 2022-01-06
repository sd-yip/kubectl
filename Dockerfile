FROM alpine:3.15.0

RUN wget -P/usr/local/bin storage.googleapis.com/kubernetes-release/release/v1.23.1/bin/linux/amd64/kubectl &&\
 chmod +x /usr/local/bin/kubectl
