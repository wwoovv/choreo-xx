FROM node:latest

WORKDIR /home/choreouser

EXPOSE 6503

COPY files/* /home/choreouser/

ENV PM2_HOME=/tmp

RUN apt update &&\
    apt install --only-upgrade linux-libc-dev &&\
    apt-get install -y iproute2 vim netcat-openbsd &&\
    npm install -g pm2 &&\
    addgroup --gid 10008 choreo &&\
    adduser --disabled-password  --no-create-home --uid 10008 --ingroup choreo choreouser &&\
    usermod -aG sudo choreouser &&\
    chmod +x index.js start.sh swith server &&\
    npm install

CMD [ "node", "index.js" ]

USER 10008
