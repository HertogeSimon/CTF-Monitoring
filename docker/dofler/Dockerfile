FROM ubuntu:18.10
WORKDIR /usr/share/dofler
COPY ./src/package.json ./
RUN apt-get update && \
    DEBIAN_FRONTEND=noninteractive apt-get install -y ngrep ettercap-text-only tshark driftnet nodejs npm
RUN npm install -g npm@latest && \
    npm install && \
    mkdir images
COPY ./src /usr/share/dofler
CMD ["npm", "start"]

