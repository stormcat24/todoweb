FROM node:9.2.0

WORKDIR /todoweb
COPY . /todoweb

RUN npm install -g vue-cli
RUN npm install
RUN npm run build

VOLUME /todoweb
ENV HOST 0.0.0.0

CMD ["npm", "run", "start"]

EXPOSE 3000
