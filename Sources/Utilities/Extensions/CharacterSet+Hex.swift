import Foundation

public extension CharacterSet {
    static var hex: CharacterSet {
        .init(charactersIn: "0123456789abcdef")
    }
}
