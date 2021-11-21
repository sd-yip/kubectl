FROM alpine:3.14.3

RUN wget -P/usr/local/bin storage.googleapis.com/kubernetes-release/release/v1.22.4/bin/linux/amd64/kubectl &&\
 chmod +x /usr/local/bin/kubectl
