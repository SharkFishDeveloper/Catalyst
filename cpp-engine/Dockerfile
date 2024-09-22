# Use the official GCC image from Docker Hub
FROM gcc:latest

# Set working directory inside the container
WORKDIR /usr/src/app

# Copy the script to run code and set executable permission
COPY ./scripts/run_code.sh /usr/src/app/scripts/run_code.sh

RUN chmod +x /usr/src/app/scripts/run_code.sh

# Default command to execute the run_code.sh script
CMD ["./scripts/run_code.sh"]
