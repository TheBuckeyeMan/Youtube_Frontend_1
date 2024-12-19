# # Step 1: Use the official Node.js image for building the app
# FROM node:18-alpine AS builder

# # Step 2: Set the working directory inside the container
# WORKDIR /app

# # Step 3: Copy package.json and package-lock.json
# COPY package*.json ./

# # Step 4: Install dependencies
# RUN npm ci

# # Step 5: Copy the application source code
# COPY . .

# #Build the React application for production
# RUN chmod -R 755 /app/node_modules/.bin && npm run build

# # Step 6: Build the React application for production
# RUN npm run build

# # Step 7: Use Nginx to serve the production build
# FROM nginx:alpine

# # Step 8: Copy the React build output to Nginx's web server directory
# COPY --from=builder /app/build /usr/share/nginx/html

# # Step 9: Expose port 80 for Nginx - Use localhost:3000
# EXPOSE 80

# # Step 10: Start Nginx
# CMD ["nginx", "-g", "daemon off;"]
# Step 1: Use the official Node.js image for building the app
FROM node:18-alpine AS builder

# Step 2: Set the working directory
WORKDIR /app

# Step 3: Copy package files and install dependencies
COPY package.json package-lock.json ./
RUN npm ci

# Step 4: Copy source code and build
COPY . .
RUN npm run build

# Step 5: Use Nginx to serve the production build
FROM nginx:alpine
COPY --from=builder /app/build /usr/share/nginx/html
EXPOSE 80
CMD ["nginx", "-g", "daemon off;"]
