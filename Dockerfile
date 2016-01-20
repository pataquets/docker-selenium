FROM selenium/standalone-firefox

USER root

RUN \
  apt-get update && \
  DEBIAN_FRONTEND=noninteractive \
    apt-get install -y --no-install-recommends \
      daemontools \
      inotify-tools \
      moreutils \
  && \
  apt-get clean && \
  rm -rf /var/lib/apt/lists/*

ADD \
  https://github.com/pataquets/cloe_run/raw/master/cloe_run \
  /usr/local/bin/
RUN chmod -v a+rx /usr/local/bin/cloe_run

USER seluser

ENV CLOE_RUN_BIN /opt/bin/entry_point.sh
ENTRYPOINT [ "/usr/local/bin/cloe_run" ]
