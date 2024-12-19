# Step 1: Use the official Node.js image for building the app
FROM node:18-alpine AS build

# Step 2: Set the working directory inside the container
WORKDIR /app

# Step 3: Copy package.json and package-lock.json
COPY package.json package-lock.json ./

# Step 4: Install dependencies
RUN npm ci

# Step 5: Copy the application source code
COPY . .

# Step 6: Build the React application for production
RUN npm run build

# Step 7: Use Nginx to serve the production build
FROM nginx:alpine

# Step 8: Copy the React build output to Nginx's web server directory
COPY --from=build /app/build /usr/share/nginx/html

# Step 9: Expose port 80 for Nginx - Use localhost:3000
EXPOSE 80

# Step 10: Start Nginx
CMD ["nginx", "-g", "daemon off;"]
