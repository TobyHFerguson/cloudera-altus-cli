FROM python:3.7-alpine
MAINTAINER Toby Ferguson <toby@cloudera.com>
RUN apk add --no-cache groff openssh openssh-client jq
RUN pip install altuscli
VOLUME /root/.altus
COPY configs/ssh_config /etc/ssh/ssh_config
EXPOSE 1080
