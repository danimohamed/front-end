# Stage 1: Build the Angular application
FROM node:latest as build
WORKDIR /app
COPY package.json package-lock.json ./
RUN npm install
COPY . .
RUN npm run build --prod

# Stage 2: Serve the Angular application using Nginx
FROM nginx:alpine
COPY --from=build /app/dist/frontend /usr/share/nginx/html
