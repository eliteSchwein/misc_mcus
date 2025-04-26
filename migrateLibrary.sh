#!/bin/bash

# Define the directory containing the files
directory="Library/easyeda2kicad/.pretty"

# Define the search and replace strings
search="/Library/easyeda2kicad/.3dshapes"
replace="\${KIPRJMOD}/../../Library/easyeda2kicad/.3dshapes"

# Find and replace in all files within the directory, but only if the replacement is not already present
find "$directory" -type f | while read -r file; do
    if grep -q "$replace" "$file"; then
        echo "Skipping $file (already replaced)"
    else
        sed -i "s|$search|$replace|g" "$file"
    fi
done

echo "Replacement validation completed successfully."