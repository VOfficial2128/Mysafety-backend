# Base image with Node.js 20
FROM node:20-alpine

WORKDIR /app

COPY package*.json ./

RUN npm install

COPY . .

# Increase Node.js heap for TypeScript compilation
RUN NODE_OPTIONS="--max-old-space-size=2048" npm run build

RUN mkdir -p /app/logs && chmod 777 /app/logs

EXPOSE 4000

CMD ["npm", "start"]