#!/bin/bash

set -e 

return_type="Int"
return_value="-1"
test_return_value="0"

while getopts "s" o; do
  case "${o}" in
    s)
      return_type="String"
      return_value='"not solved"'
      test_return_value='""'
      ;;
    *)
      exit 1
      ;;
  esac
done
shift $((OPTIND-1))

day_number=$1
day_name="Day${day_number}"

year_number=$2
if [[ -z $year_number ]]; then
  year_number=$(ls -d Sources/AdventOfCode* | sort | tail -n 1 | grep -o "\d*")
fi

day_folder_path="Sources/AdventOfCode${year_number}/${day_name}"
test_folder_path="Tests/AdventOfCode${year_number}Tests"

# Create folder for day
mkdir -p "${day_folder_path}"
mkdir -p "${test_folder_path}"

# Create day file
day_file_path="${day_folder_path}/${day_name}.swift"
cp "./scripts/DayTemplate.swift" "${day_file_path}"
sed -i "" "s/{DAY_NAME}/${day_name}/g" "${day_file_path}"
sed -i "" "s/{DAY_NUMBER}/${day_number}/g" "${day_file_path}"
sed -i "" "s/{RETURN_TYPE}/${return_type}/g" "${day_file_path}"
sed -i "" "s/{RETURN_VALUE}/${return_value}/g" "${day_file_path}"

# Create input file
touch "${day_folder_path}/input.txt"

# Create tests file
test_file_path="${test_folder_path}/${day_name}Tests.swift"
cp "./scripts/DayTestsTemplate.swift" "${test_file_path}"
sed -i "" "s/{DAY_NAME}/${day_name}/g" "${test_file_path}"
sed -i "" "s/{YEAR_NUMBER}/${year_number}/g" "${test_file_path}"
sed -i "" "s/{RETURN_VALUE}/${test_return_value}/g" "${test_file_path}"

# Add day to year
sed -i "" "/{DAYS}/i\\
        ${day_name}(),\\
" "Sources/AdventOfCode${year_number}/AdventOfCode${year_number}.swift"

echo "Created Day $day_number!"

printf "\nAdd the input to your clipboard then press any key.\n"
read -r -n1 key

pbpaste > "${day_folder_path}/input.txt"
