FROM drydock/u14:prod

ADD . /tmp

RUN /tmp/script.sh && rm -rf /tmp
