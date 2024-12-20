# Step 1: Use the official Node.js image for building the app
FROM node:18-alpine AS builder

# Step 2: Set the working directory inside the container
WORKDIR /app

# Step 3: Copy package.json and package-lock.json
COPY . /app/

# Step 4: Install dependencies
RUN npm install
RUN npm install react-scripts@5.0.1 -g

# Step 6: Build the React application for production
RUN npm run build

# Step 7: Use Nginx to serve the production build
FROM nginx:alpine

# Step 8: Copy the React build output to Nginx's web server directory
COPY --from=builder /app/build /usr/share/nginx/html
RUN rm /etc/nginx/conf.d/default.conf
COPY nginx.conf /etc/nginx/conf.d

EXPOSE 80
CMD ["nginx", "-g", "daemon off;"]