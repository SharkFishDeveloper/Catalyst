#!/bin/bash

# Path to the code file to compile
CODE_FILE="/usr/src/app/main"

# Determine the file extension based on the file name
if [ -f "$CODE_FILE.c" ]; then
    FILE_EXTENSION="c"
elif [ -f "$CODE_FILE.cpp" ]; then
    FILE_EXTENSION="cpp"
else
    echo "No valid C or C++ file found!"
    exit 1
fi

# Compile the code based on its type
if [ "$FILE_EXTENSION" == "c" ]; then
    gcc -o output_program "$CODE_FILE.c" 2> compile_error.txt
elif [ "$FILE_EXTENSION" == "cpp" ]; then
    g++ -o output_program "$CODE_FILE.cpp" 2> compile_error.txt
fi

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
