#!/bin/bash

day_number=$1
day_name="Day${day_number}"

year_number="2021"

day_folder_path="Sources/AdventOfCode${year_number}/${day_name}"
test_file_path="Tests/AdventOfCode${year_number}Tests/${day_name}Tests.swift"

sed -i "" "/{DAYS}/i\
\        ${day_name}(),
" "Sources/AdventOfCode${year_number}/AdventOfCode${year_number}.swift"

# Create folder for day
mkdir "${day_folder_path}"

# Create day file
day_file_path="${day_folder_path}/${day_name}.swift"
cp "./scripts/DayTemplate.swift" "${day_file_path}"
sed -i "" "s/{DAY_NAME}/${day_name}/g" "${day_file_path}"
sed -i "" "s/{DAY_NUMBER}/${day_number}/g" "${day_file_path}"

# Create input file
input_file_path="${day_folder_path}/${day_name}+Input.swift"
cp "./scripts/DayInputTemplate.swift" "${input_file_path}"
sed -i "" "s/{DAY_NAME}/${day_name}/g" "${input_file_path}"

# Create tests file
cp "./scripts/DayTestsTemplate.swift" "${test_file_path}"
sed -i "" "s/{DAY_NAME}/${day_name}/g" "${test_file_path}"
sed -i "" "s/{YEAR_NUMBER}/${year_number}/g" "${test_file_path}"
