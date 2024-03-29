# Stage 1: Build the React app
FROM nginx:1.21.6-alpine
COPY build /usr/share/nginx/html

EXPOSE 80

CMD ["nginx", "-g", "daemon off;"]
