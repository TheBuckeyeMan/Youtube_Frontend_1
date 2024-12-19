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

# Step 6: Build the React application for production
RUN npm run build

# Step 7: Use Nginx as a lightweight web server
FROM nginx:alpine

# Step 8: Copy the build output to the Nginx web server's directory
COPY --from=build /app/build /usr/share/nginx/html

# Step 9: Copy custom Nginx configuration if needed (optional)
# COPY nginx.conf /etc/nginx/conf.d/default.conf

# Step 10: Expose the port for Nginx
EXPOSE 8000

# Step 11: Start Nginx
CMD ["nginx", "-g", "daemon off;"]
