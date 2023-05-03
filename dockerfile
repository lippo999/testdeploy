# Stage 1: Build the Angular app
FROM node:14 AS build
WORKDIR /app
COPY package*.json ./
RUN npm install
COPY . .
RUN npm run build --prod

# Stage 2: Set up Nginx
FROM nginx:1.21-alpine
COPY --from=build /app/dist/deploy /usr/share/nginx/html
COPY nginx.conf /etc/nginx/conf.d/default.conf
