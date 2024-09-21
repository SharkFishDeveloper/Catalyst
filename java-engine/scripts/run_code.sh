#!/bin/bash

# Path to the Java file to compile
CODE_FILE="/usr/src/app/Main.java"

# Compile the Java code and store the result
javac $CODE_FILE 2> compile_error.txt

# Check if there were any compilation errors
if [ $? -ne 0 ]; then
    echo "Compilation failed!"
    cat compile_error.txt
    exit 1
fi

# Run the compiled Java program and capture runtime errors
java -cp /usr/src/app Main > output.txt 2> runtime_error.txt

# Check if there were any runtime errors
if [ $? -ne 0 ]; then
    echo "Runtime error!"
    cat runtime_error.txt
    exit 1
fi

# Display the output if the program ran successfully
echo "Program output:"
cat output.txt
