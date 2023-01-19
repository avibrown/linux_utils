#!/bin/bash

# Declare an array of folder paths
folders=("/path/to/folder1" "/path/to/folder2" "/path/to/folder3")

# Iterate over all folder paths in the array
for folder in "${folders[@]}"
do
    # Use the `find` command to count the number of files in the folder
    # The -type f option limits the search to regular files only
    file_count=$(find "$folder" -type f | wc -l)

    # Output the number of files in the folder
    echo "$folder: $file_count files"
done
