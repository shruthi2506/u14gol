FROM drydock/u14:{{%TAG%}}

ADD . /u14gol

RUN /u14gol/install.sh
