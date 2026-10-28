FROM node:22

WORKDIR /app

COPY package*.json .
COPY server.js ./
COPY images ./images
COPY index.html .


RUN npm install

EXPOSE 3000

CMD ["npm", "start"]