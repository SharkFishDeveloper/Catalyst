FROM debian:latest

# Set working directory
WORKDIR /usr/src/app

# Install necessary dependencies including the latest JDK
RUN apt-get update && apt-get install -y \
    gcc && apt-get clean
    # openjdk python3 nodejs npm \

# Copy the engines into the container
COPY cpp-engine /usr/src/app/cpp-engine
# COPY java-engine /usr/src/app/java-engine
# COPY python-engine /usr/src/app/python-engine
# COPY node-engine /usr/src/app/node-engine



# Copy the run script
COPY run_all.sh .

# Make the script executable
RUN chmod +x run_all.sh

# Default command to execute the run script
CMD ["./run_all.sh"]
