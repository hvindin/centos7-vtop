FROM docker.io/centos:latest
COPY dumb-init /usr/bin/dumb-init
RUN yum fs filter languages en:US && yum fs filter documentation \
    && yum update "*" -y && yum install -y epel-release && yum install -y nodejs npm \
    && yum clean all -y && npm -g install vtop && chmod +x /usr/bin/dumb-init \
    && useradd vtop
USER vtop
LABEL base.os="centos7" base.version="7.3.1611" vtop.version="0.4.2" in.ind.hcv.centos7.vtop.vcs-ref-short="4a50de0"
      org.label-schema.schema-version="1.0" org.label-cehma.docker.cmd="docker run --pid host -ti --rm docker.io/hvindin/centos7-vtop" \
      org.label-schema.build-date="2017-02-05 20:07:19+11:00" org.label-schema.name="centos7-vtop" \
      org.label-schema.description="centos7 container running vtop, a graphic view of system resource usage" \
      org.label-schema.url="https://github.com/MrRio/vtop" org.label-schema.vcs-url="https://github.com/hvindin/centos7-vtop" \
      org.label-schema.vcs-ref="4a50de014c4c4ea20c9524bd4e7aaebaef54beb1" org.label-schema.vendor="hvindin" \
      org.label-schema.docker.cmd.help="docker run docker.io/hvindin/centos7-vtop:latest --help" org.label-schema.version="1"
ENTRYPOINT ["/usr/bin/dumb-init","--","/usr/bin/vtop"]
