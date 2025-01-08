#!/bin/bash

# Check if the correct#!/bin/bash

# Check if the correct number of arguments is provided
if [ "$#" -ne 2 ]; then
  echo "Usage: $0 hello-world  dlrow-olleh"
  exit 1
fi

input_file="$1"
output_file="$2"

# Check if the input file exists
if [ ! -f "$input_file" ]; then
  echo "Error: Input file '$input_file' not found."
  exit 1
fi

# Clear the output file if it exists, or create it
> "$output_file"

# Read each line of the input file, reverse it, and save it to the output file
while IFS= read -r line; do
  echo "$line" | rev >> "$output_file"
done < "$input_file"

echo "Content reversed line by line and saved to '$output_file'. number of arguments is provided
