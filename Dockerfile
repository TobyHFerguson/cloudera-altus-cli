FROM python:3.7-alpine
MAINTAINER Toby Ferguson <toby@cloudera.com>
RUN apk add --no-cache groff
RUN pip install altuscli
VOLUME /root/.altus
ENTRYPOINT ["altus"]
CMD ["help"]
