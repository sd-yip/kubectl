FROM dhallhaskell/dhall-json:1.7.10@sha256:e379d0f9b4e8fab618c545bd237b17cf6527c4798bfda6a873d41a8ac2167d10 AS dhall-json

FROM python:3.10.2-alpine@sha256:b716677823ca2fc111863461d0ca76323cdeca83e648e4501afefc2006f49dd2

RUN apk add --no-cache nodejs-current=17.7.1-r0 &&\
 apk add --no-cache -tt npm gcc musl-dev libffi-dev openssl-dev &&\
 npm i -g zserve@0.2.0 &&\
 pip install ansible-base==2.10.17 &&\
 apk del t

RUN wget -P/usr/local/bin storage.googleapis.com/kubernetes-release/release/v1.23.4/bin/linux/amd64/kubectl &&\
 chmod +x /usr/local/bin/kubectl

COPY --from=dhall-json /bin/dhall-to-json /usr/local/bin
COPY --from=dhall-json /bin/dhall-to-yaml /usr/local/bin
COPY --from=dhall-json /bin/json-to-dhall /usr/local/bin
