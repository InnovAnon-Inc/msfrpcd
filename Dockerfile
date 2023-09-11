FROM ubuntu as build

ARG DEBIAN_FRONTEND=noninteractive

COPY dist/ /tmp/dist/

#RUN rm -v                          \
#    /tmp/dist/ldap-utils_*.deb     \
#    /tmp/dist/libldap*-dev_*.deb   \
    #/tmp/dist/libldap-*.deb        \
RUN apt update                     \
&&  apt full-upgrade -y            \
    --no-install-recommends        \
&&  apt install      -y            \
    --no-install-recommends        \
    /tmp/dist/bash_*.deb           \
    vim                            \
&&  apt autoremove   -y            \
    --purge                        \
&&  apt clean        -y            \
&&  rm -rf  /var/lib/apt/lists/*   \
&&  rm -rfv /tmp/dist/

VOLUME ["/root"]

ENTRYPOINT ["/usr/bin/env", "bash", "-i"]

