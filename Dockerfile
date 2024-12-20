##IF USING THIS DOCKERFILE IN A SEPORATE REPO WITH REACT: - Must also copy over nginx.conf to your other repo as well
FROM node:18-alpine AS builder

WORKDIR /app

COPY . /app/

RUN npm install
RUN npm install react-scripts@5.0.1 -g
RUN npm run build

FROM nginx:alpine

COPY --from=builder /app/build /usr/share/nginx/html
RUN rm /etc/nginx/conf.d/default.conf
COPY nginx.conf /etc/nginx/conf.d

EXPOSE 80
CMD ["nginx", "-g", "daemon off;"]