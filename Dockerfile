FROM dhallhaskell/dhall-json:1.7.9 AS dhall-json

FROM alpine:3.15.0

RUN wget -P/usr/local/bin storage.googleapis.com/kubernetes-release/release/v1.23.1/bin/linux/amd64/kubectl &&\
 chmod +x /usr/local/bin/kubectl

COPY --from=dhall-json /bin/dhall-to-json /usr/local/bin
COPY --from=dhall-json /bin/dhall-to-yaml /usr/local/bin
COPY --from=dhall-json /bin/json-to-dhall /usr/local/bin
