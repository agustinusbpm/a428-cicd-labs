FROM node:16-buster-slim
COPY . /app
WORKDIR /app
EXPOSE 3000
CMD ["npm", "start"]