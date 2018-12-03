day_number=$1
day_name="Day${day_number}"
file_path="Sources/${day_name}/${day_name}.swift"
test_file_path="Tests/AdventOfCode2018Tests/${day_name}Tests.swift"

sed -i '' '/{DEPENDENCIES}/i\
\                \"'${day_name}'\",\
' Package.swift

sed -i '' '/{TARGET}/i\
\        .target(\
\            name: \"'${day_name}'\",\
\            dependencies: []),\
' Package.swift

mkdir "Sources/${day_name}"


cp "./support/DayTemplate.swift" "${file_path}"
sed -i '' 's/{DAY_NAME}/'${day_name}'/g' "${file_path}"

cp "./support/Input.swift" "Sources/${day_name}"

cp "./support/DayTestsTemplate.swift" "${test_file_path}"
sed -i '' 's/{DAY_NAME}/'${day_name}'/g' "${test_file_path}"

rm -rf AdventOfCode2018.xcodeproj/
swift package generate-xcodeproj
open AdventOfCode2018.xcodeproj
