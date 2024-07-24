# Use the official Node.js 22.5 image as the base image for building
FROM node:22.5-alpine AS build

# Set the working directory
WORKDIR /app

# Copy package.json and package-lock.json to the container
COPY package.json package-lock.json ./

# Install dependencies
RUN npm install

# Copy the rest of the application code to the container
COPY . .

# Build the React application
RUN npm run build

# Use the official Node.js 22.5 image as the base image for serving
FROM node:22.5-alpine

# Set the working directory
WORKDIR /app

# Copy the build output from the previous stage
COPY --from=build /app/build /app/build

# Install serve package to serve the build
RUN npm install -g serve

# Expose port 3000 for the server
EXPOSE 3000

# Start the application on port 3000
CMD ["serve", "-s", "build", "-l", "3000"]