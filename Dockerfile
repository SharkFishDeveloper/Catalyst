FROM debian:latest

WORKDIR /usr/src/app

# Install necessary dependencies including the latest JDK
RUN apt-get update && apt-get install -y \
    clang make \
    openjdk-17-jdk \
    nodejs npm\
    python3 \
    && apt-get clean


COPY ./py.sh ./py.sh
COPY ./cp.sh ./cp.sh
COPY ./j.sh ./j.sh
COPY ./jv.sh ./jv.sh

COPY ./cpp-engine /usr/src/app/cpp-engine
COPY ./java-engine /usr/src/app/java-engine
COPY ./python-engine /usr/src/app/python-engine
COPY ./js-engine /usr/src/app/js-engine

RUN chmod +x /usr/src/app/*.sh

COPY ./server/package.json ./server/package.json
COPY ./server/package-lock.json ./server/package-lock.json
RUN cd server && npm install

CMD ["node", "./server/index.js"]

# -------------------------------------

# c
# no inputtrue in this

# docker run --rm -v $(pwd)/cpp-engine/app/main.c:/usr/src/app/cpp-engine/app/main.c --ulimit cpu=5 full1 ./cp.sh c

# docker run --rm -v $(pwd)/cpp-engine/app/main.c:/usr/src/app/cpp-engine/app/main.c -v $(pwd)/cpp-engine/app/input.txt:/usr/src/app/cpp-engine/app/input.txt --ulimit cpu=5 full1 ./cp.sh cpp 


# --------------------------------
# c++

# docker run --rm -v $(pwd)/cpp-engine/app/main.cpp:/usr/src/app/cpp-engine/app/main.cpp --ulimit cpu=5 full1 ./cp.sh cpp 

# docker run --rm -v $(pwd)/cpp-engine/app/main.cpp:/usr/src/app/cpp-engine/app/main.cpp -v $(pwd)/cpp-engine/app/input.txt:/usr/src/app/cpp-engine/app/input.txt --ulimit cpu=5 full1 ./cp.sh cpp 

# --------------------------------

# js

# docker run --rm -v $(pwd)/js-engine/app/main.js:/usr/src/app/js-engine/app/main.js --ulimit cpu=5 full ./j.sh inputtrue

# docker run --rm -v $(pwd)/js-engine/app/index.js:/usr/src/app/js-engine/app/index.js  -v $(pwd)/js-engine/app/input.txt:/usr/src/app/js-engine/app/input.txt  --ulimit cpu=5 full1 ./j.sh inputtrue

# --------------------------------

# java
# docker run --rm -v $(pwd)/java-engine/app/Main.java:/usr/src/app/java-engine/app/Main.java --ulimit cpu=5 full1 ./jv.sh


# docker run --rm -v $(pwd)/java-engine/app/Main.java:/usr/src/app/java-engine/app/Main.java  -v $(pwd)/java-engine/app/input.txt:/usr/src/app/java-engine/app/input.txt    --ulimit cpu=5 full1 ./jv.sh inputtrue

# --------------------------------
# python

# docker run --rm -v $(pwd)/python-engine/app/main.py:/usr/src/app/python-engine/app/main.py --ulimit cpu=5 full1 ./py.sh 

# docker run --rm -v $(pwd)/python-engine/app/main.py:/usr/src/app/python-engine/app/main.py -v $(pwd)/python-engine/app/input.txt:/usr/src/app/python-engine/app/input.txt  --ulimit cpu=5 full1 ./py.sh inputtrue

# -------------------------------------




