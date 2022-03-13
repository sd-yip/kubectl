FROM dhallhaskell/dhall-json:1.7.10@sha256:e379d0f9b4e8fab618c545bd237b17cf6527c4798bfda6a873d41a8ac2167d10 AS dhall-json

FROM alpine:3.15.0@sha256:e7d88de73db3d3fd9b2d63aa7f447a10fd0220b7cbf39803c803f2af9ba256b3

RUN wget -P/usr/local/bin storage.googleapis.com/kubernetes-release/release/v1.23.4/bin/linux/amd64/kubectl &&\
 chmod +x /usr/local/bin/kubectl

COPY --from=dhall-json /bin/dhall-to-json /usr/local/bin
COPY --from=dhall-json /bin/dhall-to-yaml /usr/local/bin
COPY --from=dhall-json /bin/json-to-dhall /usr/local/bin
