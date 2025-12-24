# Stage 1: Build Angular Application
FROM node:alpine AS build

# Setup working directory
WORKDIR /usr/src/app

# Copy package.json and package-lock.json
COPY ./../package.json ../package-lock.json ./
# Install dependencies
RUN npm install

# Copy other files and folders to the working directory
COPY . .

# Build Angular application in PROD mode
RUN npm run build --prod

# Stage 2: Serve the application using Nginx
FROM nginx:alpine

# Copy built Angular app files to Nginx HTML folder
COPY --from=build /usr/src/app/dist/NaswendaHR/browser /usr/share/nginx/html

# Expose port 80
EXPOSE 4200

# Start Nginx server
CMD ["nginx", "-g", "daemon off;"]

