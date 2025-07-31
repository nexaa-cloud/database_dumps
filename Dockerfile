FROM alpine:3.22

RUN apk add --no-cache mariadb-client postgresql17-client dropbear-scp rsync s3cmd

ENTRYPOINT ["/bin/sh", "-c"]
