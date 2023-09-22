# Base image
FROM node:12-alpine

# Create app directory
WORKDIR /usr/src/app

# Install app dependencies for production
COPY package*.json ./
RUN npm install --omit=dev

# Bundle app source
COPY . .

# Expose App on a Port
EXPOSE 8080

# Define default command to start App
CMD [ "node", "app.js" ]
