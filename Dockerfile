# Stage 1: Build the React app
FROM node:14-alpine AS build

WORKDIR /app

COPY package*.json ./
RUN npm install

COPY . .
RUN npm run build

# Stage 2: Create a lightweight image for serving the application
FROM nginx:1.21.6-alpine AS nginx

WORKDIR /usr/share/nginx/html

COPY --from=build /app/build .

EXPOSE 3000

CMD ["nginx", "-g", "daemon off;"]
