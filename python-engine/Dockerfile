# Use the official Python image from Docker Hub
FROM python:3.9-slim

# Set working directory inside the container
WORKDIR /usr/src/app

# Copy the script to run code and set executable permission
COPY ./scripts/run_code.sh /usr/src/app/scripts/run_code.sh
COPY ./app ./app
# Ensure the script has executable permissions
RUN chmod +x /usr/src/app/scripts/run_code.sh

# Default command to execute the run_code.sh script
CMD ["./scripts/run_code.sh"]