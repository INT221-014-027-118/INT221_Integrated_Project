FROM node:14.17.1-alpine3.13  as build-stage
WORKDIR /app
COPY package*.json ./
RUN npm install
RUN vue upgrade
COPY ./ .
RUN npm run build
EXPOSE 9090
FROM nginx 
RUN mkdir /app
COPY --from=build-stage /app/dist /app
COPY nginx.conf /etc/nginx/nginx.conf
CMD ["nginx", "-g", "daemon off;"]s