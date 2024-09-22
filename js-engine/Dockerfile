# Use the official Node.js image from Docker Hub
FROM node:18-slim

# Set working directory inside the container
WORKDIR /usr/src/app

# Copy the script to run code
COPY ./scripts/run_code.sh /usr/src/app/scripts/run_code.sh

# Ensure the script has executable permissions
RUN chmod +x /usr/src/app/scripts/run_code.sh

# Install any dependencies if necessary (uncomment if you have a package.json)
# COPY ./app/package.json /usr/src/app/app/package.json
# RUN npm install --prefix ./app

# Default command to execute the run_code.sh script
CMD ["./scripts/run_code.sh"]
