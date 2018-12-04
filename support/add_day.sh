day_number=$1
day_name="Day${day_number}"

sources_path="Sources/"
day_folder_path="${sources_path}/${day_name}"
test_file_path="Tests/AdventOfCode2018Tests/${day_name}Tests.swift"

sed -i '' '/{DEPENDENCIES}/i\
\                \"'${day_name}'\",\
' Package.swift

sed -i '' '/{TARGET}/i\
\        .target(\
\            name: \"'${day_name}'\",\
\            dependencies: ["Utilities"]),\
' Package.swift

sed -i '' '/{IMPORTS}/i\
import '${day_name}'\
' "Sources/AdventOfCode2018/main.swift"

# Create folder for day
mkdir "${days_folder_path}"

# Create day file
day_file_path="${day_folder_path}/${day_name}.swift"
cp "./support/DayTemplate.swift" "${day_file_path}"
sed -i '' 's/{DAY_NAME}/'${day_name}'/g' "${day_file_path}"

# Create input file
input_file_path="${day_folder_path}/${day_name}+Input.swift"
cp "./support/DayInputTemplate.swift" "${input_file_path}"
sed -i '' 's/{DAY_NAME}/'${day_name}'/g' "${input_file_path}"

# Create tests file
cp "./support/DayTestsTemplate.swift" "${test_file_path}"
sed -i '' 's/{DAY_NAME}/'${day_name}'/g' "${test_file_path}"

# Regerenate Xcode project
rm -rf AdventOfCode2018.xcodeproj/
swift package generate-xcodeproj
open AdventOfCode2018.xcodeproj
