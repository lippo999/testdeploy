# Start with the Nginx image
FROM nginx:1.21-alpine

# Copy the 'dist' folder from the Jenkins workspace
COPY dist /usr/share/nginx/html

# Copy the nginx configuration file
COPY nginx.conf /etc/nginx/conf.d/default.conf
