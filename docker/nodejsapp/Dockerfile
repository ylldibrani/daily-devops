FROM --platform=linux/amd64 node:18

WORKDIR /app

COPY package*.json ./
RUN npm install -save express
RUN npm install
COPY . .

CMD ["node", "app.js"]