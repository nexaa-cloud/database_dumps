FROM alpine:3.22

#Add backup-user
RUN apk add --no-cache mariadb-client postgresql17-client openssh aws-cli
RUN addgroup -S backup && adduser -S backup -G backup

#Set SSH config
RUN mkdir -p /home/backup/.ssh
RUN chmod 0700 /home/backup/.ssh
COPY ssh-config /home/backup/.ssh/config
RUN chmod 0600 /home/backup/.ssh/config
RUN chown -R backup /home/backup/.ssh/

#Use backup user in container
USER backup
WORKDIR /home/backup

#Set entrypoint so shell-commands can be executed
ENTRYPOINT ["/bin/sh", "-c"]
