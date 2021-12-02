import Foundation

public struct Day4: Day {

    private static let requiredKeys = [
        "byr", "iyr", "eyr", "hgt", "hcl", "ecl", "pid"
    ]
    
    private static let optionalKeys = [
        "cid"
    ]
    
    private static let allKeys = requiredKeys + optionalKeys
    
    private func parsePassports(for input: String) -> [Passport] {
        input
            .components(separatedBy: "\n\n")
            .compactMap { (fields) -> Passport? in
                let contents = fields
                    .components(separatedBy: .whitespacesAndNewlines)
                    .map { (field) -> (String, String) in
                        let parts = field.components(separatedBy: ":")
                        return (parts[0], parts[1])
                    }
                
                return Passport(dictionary: Dictionary(uniqueKeysWithValues: contents))
            }
    }
    
    public func part1Solution(for input: String = input) -> String {
        let passports = parsePassports(for: input)
        
        return "\(passports.count)"
    }

    public func part2Solution(for input: String = input) -> String {
        let passports = parsePassports(for: input)
            .filter { $0.isValid }
        
        return "\(passports.count)"
    }
}

private struct Passport: Decodable {
    let birthYear: String
    let issueYear: String
    let expirationYear: String
    let height: String
    let hairColor: String
    let eyeColor: String
    let passportID: String
    let countryID: String?
    
    enum EyeColor: String {
        case amb
        case blu
        case brn
        case gry
        case grn
        case hzl
        case oth
    }
    
    init?(dictionary: [String: String]) {
        guard let birthYear = dictionary["byr"],
              let issueYear = dictionary["iyr"],
              let expirationYear = dictionary["eyr"],
              let height = dictionary["hgt"],
              let hairColor = dictionary["hcl"],
              let eyeColor = dictionary["ecl"],
              let passportID = dictionary["pid"] else {
            return nil
        }
        
        self.birthYear = birthYear
        self.issueYear = issueYear
        self.expirationYear = expirationYear
        self.height = height
        self.hairColor = hairColor
        self.eyeColor = eyeColor
        self.passportID = passportID
        self.countryID = dictionary["cid"]
    }
    
    var isValid: Bool {
        guard let birthYear = Int(birthYear),
              1920...2002 ~= birthYear else {
            return false
        }
        
        guard let issueYear = Int(issueYear),
              2010...2020 ~= issueYear else {
            return false
        }
        
        guard let expirationYear = Int(expirationYear),
              2020...2030 ~= expirationYear else {
            return false
        }
        
        guard let heightValue = Int(height.filter(CharacterSet.decimalDigits.contains)),
              (height.hasSuffix("cm") && 150...193 ~= heightValue)
                || (height.hasSuffix("in") && 59...76 ~= heightValue) else {
            return false
        }
        
        guard hairColor.first == "#",
              hairColor.dropFirst().allSatisfy(CharacterSet.hex.contains) else {
            return false
        }
        
        guard EyeColor(rawValue: eyeColor) != nil else {
            return false
        }
        
        guard passportID.integers.count == 9 else {
            return false
        }
        
        return true
    }
}
