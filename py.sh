#!/bin/bash

INPUT_REQUIRED=false

# Check for the flag (modify if using a different flag name)
if [[ "$1" == "inputtrue" ]]; then
  INPUT_REQUIRED=true
  shift  # Remove the flag from the argument list
fi

# Run the Python code with input redirection (if required)
if [[ $INPUT_REQUIRED == true ]]; then
  # Check if input file exists (modify if needed)
  python3 /usr/src/app/python-engine/app/main.py < /usr/src/app/python-engine/app/input.txt > output.txt 2> runtime_error.txt
else
  python3 /usr/src/app/python-engine/app/main.py > output.txt 2> runtime_error.txt
fi

# Check for runtime errors
if [ $? -ne 0 ]; then
  echo "Runtime error!"
  cat runtime_error.txt
  exit 1
fi

# Display successful execution message and output
echo "Program output:"
cat output.txt