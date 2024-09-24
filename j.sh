#!/bin/bash

# Path to the Python file to run
INPUT_REQUIRED=false

# Check for the flag (modify if using a different flag name)
if [[ "$1" == "inputtrue" ]]; then
  INPUT_REQUIRED=true
  shift  # Remove the flag from the argument list
fi



CODE_FILE="/usr/src/app/js-engine/app/index.js"


if [[ $INPUT_REQUIRED == true ]]; then

  nodejs $CODE_FILE < /usr/src/app/js-engine/app/input.txt > output.txt 2> runtime_error.txt

else
  nodejs $CODE_FILE > output.txt 2> runtime_error.txt
fi

cat output.txt




# nodejs $CODE_FILE > output.txt 2> runtime_error.txt
# # Check if there were any runtime errors
# if [ $? -ne 0 ]; then
#     echo "Runtime error!"
#     cat runtime_error.txt
#     exit 1
# fi

# Display the output if the program ran successfully