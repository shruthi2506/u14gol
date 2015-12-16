FROM drydock/u14:prod

ADD . /u14gol

RUN /u14gol/install.sh
