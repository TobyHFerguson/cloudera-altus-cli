# Build the image:
#  docker build -t altus .
#
# Run the image:
#
#    docker run -t -i -v ~/.altus:/root/.altus altus /bin/bash
#
#  OR
#
#    docker run -t -i -v ~/.altus:/root/.altus altus altus help
#
# Configure your altus credentials
#
#    :; docker run -t -i -v ~/.altus:/root/.altus altus altus configure
#    Altus Access Key ID [None]: XXX
#    Altus Private Key [None]: YYY
#
#
FROM centos:7
MAINTAINER Travis Campbell <tcampbell@cloudera.com>
RUN yum -y update \
  && yum -y install epel-release groff man
RUN yum -y install python-pip
RUN pip install altuscli
VOLUME /root/.altus