FROM alpine:latest

RUN \
    apk --no-cache add \
        openssh \
        git \
        curl \
        screen \
        bash \
        htop

RUN \
    echo PasswordAuthentication no >> /etc/ssh/sshd_config && \
    echo startup_message off >> /etc/screenrc

RUN \
  mkdir -p ~/.ssh && \
  wget -O - https://github.com/porty.keys >> ~/.ssh/authorized_keys

# undisable root account, give rubbish password hash
RUN passwd -u root

ADD start.sh /

CMD ["/start.sh"]
