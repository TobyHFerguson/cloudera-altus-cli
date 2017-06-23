FROM centos:7
MAINTAINER Travis Campbell <tcampbell@cloudera.com>
RUN yum -y update \
  && yum -y install epel-release groff man openssh openssh-clients
RUN yum -y install python-pip
RUN pip install altuscli
COPY configs/ssh_config /etc/ssh/ssh_config
VOLUME /root/.altus
EXPOSE 1080
