FROM node:alpine
WORKDIR /usr/src/app
COPY --chown=node:node . /usr/src/app
COPY package.json package-lock.json /usr/src/app/
RUN chown -R node:node /usr/local/*
RUN chown -R node:node /usr/src/app/*
USER node
RUN npm install
COPY . .
ARG PORT=4001
ENV PORT=${PORT} 
EXPOSE ${PORT}
CMD ["npm", "run", "start:dev"]
