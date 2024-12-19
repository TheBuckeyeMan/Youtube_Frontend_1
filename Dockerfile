# Step 1: Use the official Node.js image for building the app
FROM node:16 as build

# Step 2: Set the working directory inside the container
WORKDIR /app

# Step 3: Copy package.json and package-lock.json
COPY package*.json ./

# Step 4: Install dependencies
RUN npm install

# Step 5: Copy the application source code
COPY . .

# Step 6: Ensure correct permissions for scripts
RUN chmod -R 755 /app/node_modules/.bin

# Step 7: Build the React application for production
RUN npm run build

# Step 8: Use Nginx as a lightweight web server
FROM nginx:alpine

# Step 9: Copy the build output to the Nginx web server's directory
COPY --from=build /app/build /usr/share/nginx/html

# Step 10: Copy custom Nginx configuration if needed (optional)
# COPY nginx.conf /etc/nginx/conf.d/default.conf

# Step 11: Expose the port for Nginx
EXPOSE 80

# Step 12: Start Nginx
CMD ["nginx", "-g", "daemon off;"]
