# Use the official Node.js 18 image as a parent image
FROM node:18

# Set the working directory in the container
WORKDIR /app

# Copy the package.json and package-lock.json (or yarn.lock)
COPY package*.json ./

# Install dependencies
RUN npm install

# Copy the rest of your app's source code from your host to your image filesystem.
COPY . .

# Expose the port Docusaurus runs on
EXPOSE 3000

# Command to run the Docusaurus development server
CMD ["npm", "run", "start", "--", "--host", "0.0.0.0"]
