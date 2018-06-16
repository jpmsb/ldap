FROM debian:stretch

MAINTAINER João Pedro Menegali Salvan Bitencourt (joao.ms@aluno.ifsc.edu.br)

RUN export DEBIAN_FRONTEND=noninteractive && \
    apt update && \
    apt -y -q upgrade && \
    apt -y -q install slapd dialog apt-utils procps ldap-utils && \
    apt clean && \
    apt clean cache && \
    unset DEBIAN_FRONTEND && \
    rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/* /var/log/* /root/.bash_history

ENTRYPOINT slapd && bash
