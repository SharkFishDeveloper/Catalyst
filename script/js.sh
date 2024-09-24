#!/bin/bash

# Path to the Python file to run
CODE_FILE="/usr/src/app/js-engine/app/index.js"

nodejs $CODE_FILE > output.txt 2> runtime_error.txt
# Check if there were any runtime errors
if [ $? -ne 0 ]; then
    echo "Runtime error!"
    cat runtime_error.txt
    exit 1
fi

# Display the output if the program ran successfully
echo "Program output:"
cat output.txt
