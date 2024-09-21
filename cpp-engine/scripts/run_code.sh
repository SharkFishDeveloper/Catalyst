#!/bin/bash

# Path to the C++ file to compile
CODE_FILE="./app/main.cpp"

# Compile the C++ code and store the result
g++ -o output_program $CODE_FILE 2> compile_error.txt

# Check if there were any compilation errors
if [ $? -ne 0 ]; then
    echo "Compilation failed!"
    cat compile_error.txt
    exit 1
fi

# Run the compiled program and capture runtime errors
./output_program > output.txt 2> runtime_error.txt

# Check if there were any runtime errors
if [ $? -ne 0 ]; then
    echo "Runtime error!"
    cat runtime_error.txt
    exit 1
fi

# Display the output if the program ran successfully
echo "Program output:"
cat output.txt
