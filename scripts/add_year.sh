#!/bin/bash

set -e

year_number=$1

year_name="AdventOfCode${year_number}"
year_folder_path="Sources/$year_name"

# Update Package.swift to have the new year
sed -ri "" "s/(let years = [0-9]+\.{3}).*/\1$year_number/" "Package.swift"

# Create folders for the year
mkdir -p "$year_folder_path"
mkdir -p "Tests/${year_name}Tests"

# Create year file
year_file_path="${year_folder_path}/${year_name}.swift"
cp "./scripts/YearTemplate.swift" "${year_file_path}"
sed -i "" "s/{YEAR_NUMBER}/${year_number}/g" "${year_file_path}"

# Add year
sed -i "" "/{YEARS IMPORT}/i\\
    import ${year_name}\\
" "Sources/AdventOfCode/AdventOfCode.swift"

sed -i "" "/{YEARS}/i\\
    ${year_name}(),\\
" "Sources/AdventOfCode/AdventOfCode.swift"
