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

VOLUME ["/usr/share/metasploit-framework/config"]
ENTRYPOINT ["/usr/bin/env", "msfrpcd", "-f"]

