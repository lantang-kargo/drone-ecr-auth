FROM docker:18.09.3

WORKDIR /

RUN apk --update add curl groff python \
    ; set -ex \
    ; curl "https://s3.amazonaws.com/aws-cli/awscli-bundle.zip" -o "/tmp/awscli-bundle.zip" \
    ; unzip /tmp/awscli-bundle.zip -d /tmp/ \
    ; /tmp/awscli-bundle/install -b /bin/aws \
    ; export PATH=/bin:$PATH \
    ; mkdir /.aws \
    ; touch /.aws/credentials \ 
    ; touch /.aws/config \
    ; rm -rf /tmp/*
ADD docker-entrypoint.sh /
RUN chmod +x /docker-entrypoint.sh
ENTRYPOINT ["/docker-entrypoint.sh"]

