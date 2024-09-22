#!/bin/bash

# Example to run different engines
echo "Running C++ code..."
docker run --rm -v $(pwd)/cpp-engine/app/main.c:/usr/src/app/cpp-engine/main.c cpp-cde ./scripts/run_code.sh
# docker run --rm -v $(pwd)/app/main.c:/usr/src/app/main.c --ulimit cpu=5 cpp-cde ./scripts/run_code.sh 
# << EOF
# 1 2 3 4 5
# EOF