FROM kalilinux/kali-rolling

ARG DEBIAN_FRONTEND=noninteractive

RUN apt update                     \
&&  apt full-upgrade -y            \
    --no-install-recommends        \
&&  apt install      -y            \
    --no-install-recommends        \
    metasploit-framework           \
&&  apt autoremove   -y            \
    --purge                        \
&&  apt clean        -y            \
&&  rm -rf  /var/lib/apt/lists/*   \
&&  rm -rfv /tmp/dist/


WORKDIR  /var/teamhack/upload
VOLUME ["/var/teamhack/upload"]

VOLUME ["/usr/share/metasploit-framework/config"]
ENTRYPOINT ["/usr/bin/env", "msfrpcd", "-f"]

#ENV MSFRPC_USERNAME
#ENV MSFRPC_PASSWORD
#CMD [                     \
#  "-S",                   \ 
#  "-U", $MSFRPC_USERNAME, \
#  "-P", $MSFRPC_PASSWORD  \
#]

EXPOSE 55553/tcp

