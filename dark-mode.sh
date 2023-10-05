#!/bin/bash
# Specify the path to your .desktop file
desktop_file="/usr/share/applications/microsoft-edge.desktop"
# Use a temporary file to store the modified content
temp_file="${desktop_file}.temp"
# Loop through the lines in the .desktop file
while IFS= read -r line; do
if [[ $line == Exec=* ]]; then
# Append "--force-dark-mode" to lines that start with "Exec"
line="${line} --force-dark-mode"
fi
# Append the line to the temporary file
echo "$line" >> "$temp_file"
done < "$desktop_file"
# Replace the original .desktop file with the modified temporary file
sudo mv "$temp_file" "$desktop_file"