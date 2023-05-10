FROM alpine:3.18

COPY entrypoint.sh /entrypoint.sh
RUN apk update && \
    apk upgrade && \
    apk add bash && \
    chmod +x /entrypoint.sh

ENTRYPOINT [ "/entrypoint.sh" ]
