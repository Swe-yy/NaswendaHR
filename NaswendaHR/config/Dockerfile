# Stage 1: Build Angular Application
FROM node:alpine 

# Setup working directory
WORKDIR /usr/src/app

# Copy package.json and package-lock.json
COPY ./../package.json ../package-lock.json ./
# Install dependencies
RUN npm install -g @angular/cli@latest
RUN npm install
# Copy other files and folders to the working directory
COPY . .

EXPOSE 4200

CMD ["ng","serve","--host","0.0.0.0", "--port","4200", "--poll", "2000"]
