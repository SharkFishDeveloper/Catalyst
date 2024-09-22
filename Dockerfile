FROM debian:latest
# FROM ubuntu:latest
# Set working directory
WORKDIR /usr/src/app

# Install necessary dependencies including the latest JDK
RUN apt-get update && apt-get install -y \
    clang make \
    openjdk-17-jdk \
    nodejs \
    python3 \
    && apt-get clean

# Copy the engines into the container
COPY ./cpp-engine /usr/src/app/cpp-engine
COPY ./java-engine /usr/src/app/java-engine
COPY ./python-engine /usr/src/app/python-engine
COPY ./js-engine /usr/src/app/js-engine
COPY ./scripts ./scripts

RUN chmod +x /usr/src/app/scripts/js_run.sh
# -------------------------------------
# c
# docker run --rm -v $(pwd)/cpp-engine/app/main.c:/usr/src/app/cpp-engine/app/main.c --ulimit cpu=5 full ./scripts/cpp_run.sh c

# c++
# docker run --rm -v $(pwd)/cpp-engine/app/main.cpp:/usr/src/app/cpp-engine/app/main.cpp --ulimit cpu=5 full ./scripts/cpp_run.sh cpp

# js
# docker run --rm -v $(pwd)/js-engine/app/main.js:/usr/src/app/js-engine/app/main.js --ulimit cpu=5 full ./scripts/js_run.sh

# java
# docker run --rm -v $(pwd)/java-engine/app/main.java:/usr/src/app/java-engine/app/main.java --ulimit cpu=5 full ./scripts/java_run.sh

# python
# docker run --rm -v $(pwd)/python-engine/app/main.py:/usr/src/app/python-engine/app/main.py --ulimit cpu=5 full ./scripts/python_run.sh

# -------------------------------------
