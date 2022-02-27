FROM dhallhaskell/dhall-json:1.7.10@sha256:e379d0f9b4e8fab618c545bd237b17cf6527c4798bfda6a873d41a8ac2167d10 AS dhall-json

FROM python:3.10.2-alpine@sha256:30fb678d7f0b4265525d58a7be2973c83755c93dda401a0d5979942eeaecd361

RUN apk add nodejs-current=17.6.0-r0 &&\
 apk add --no-cache -tt npm=8.1.3-r0 gcc musl-dev libffi-dev openssl-dev &&\
 npm i -g zserve@0.1.3 &&\
 pip install ansible-base==2.10.17 &&\
 apk del t

RUN wget -P/usr/local/bin storage.googleapis.com/kubernetes-release/release/v1.23.3/bin/linux/amd64/kubectl &&\
 chmod +x /usr/local/bin/kubectl

COPY --from=dhall-json /bin/dhall-to-json /usr/local/bin
COPY --from=dhall-json /bin/dhall-to-yaml /usr/local/bin
COPY --from=dhall-json /bin/json-to-dhall /usr/local/bin
