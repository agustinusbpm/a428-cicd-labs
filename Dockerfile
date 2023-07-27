FROM node:16-buster-slim
COPY . /app
WORKDIR /app
RUN npm run build
EXPOSE 3000
CMD ["npm", "start"]