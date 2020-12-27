FROM python:3.9.1-alpine3.12

RUN apk add --no-cache -tt gcc musl-dev libffi-dev openssl-dev &&\
 pip install ansible-base==2.10.4 &&\
 apk del t

RUN wget -P/usr/local/bin storage.googleapis.com/kubernetes-release/release/v1.20.1/bin/linux/amd64/kubectl &&\
 chmod +x /usr/local/bin/kubectl
