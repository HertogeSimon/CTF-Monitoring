FROM ubuntu:18.10
WORKDIR /usr/share/dofler
COPY ./src/package.json ./
RUN apt-get update && \
    DEBIAN_FRONTEND=noninteractive apt-get install -y ngrep ettercap-text-only tshark driftnet nodejs npm && \
    npm install && \
    mkdir images
COPY ./src /usr/share/dofler
# ENV MYSQL_ROOT_PASSWORD dofler
CMD ["npm", "start"]

