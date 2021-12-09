import Foundation

struct Day13: Day {

    struct Cart: Hashable {
        var position: Point
        var heading: Heading
        private var intersectionCount = 0
        
        init(position: Point, heading: Heading) {
            self.position = position
            self.heading = heading
        }
        
        static func ==(_ lhs: Cart, _ rhs: Cart) -> Bool {
            return lhs.position == rhs.position
        }
        
        func hash(into hasher: inout Hasher) {
            hasher.combine(position)
        }
        
        mutating func handleIntersection() {
            let directions: [Direction] = [.left, .forward, .right]
            let direction = directions[intersectionCount % directions.count]
            heading = heading.turn(direction)
            intersectionCount += 1
        }
    }
    
    enum TrackPiece {
        case corner(Heading, Heading)
        case intersection
    }
    
    struct Track {
        var carts: Set<Cart> = []
        var pieces: [Point: TrackPiece] = [:]
        
        enum Error: Swift.Error {
            case crash(Point)
        }
        
        func print(on map: [[String]]) {
            var map = map
            for cart in carts {
                map[cart.position.y][cart.position.x] = {
                    switch cart.heading {
                    case .north: return "^"
                    case .east: return ">"
                    case .south: return "v"
                    case .west: return "<"
                    }
                }()
            }
            Swift.print(map.map { $0.joined() }.joined(separator: "\n"))
        }
    }
    
    func parseTrack(_ input: Input) -> Track {
        var track = Track()
        
        input.lines.enumerated().forEach { (y, line) in
            var prev: Character?
            line.raw.enumerated().forEach { (x, char) in
                let p = Point(x: x, y: y)
                switch (prev, char) {
                case ("-", "/"), ("+", "/"), ("<", "/"), (">", "/"):
                    track.pieces[p] = .corner(.west, .north)
                case (_, "/"): track.pieces[p] = .corner(.east, .south)
                case ("-", "\\"), ("+", "\\"), (">", "\\"), ("<", "\\"):
                    track.pieces[p] = .corner(.west, .south)
                case (_, "\\"): track.pieces[p] = .corner(.east, .north)
                case (_, "+"): track.pieces[p] = .intersection
                case (_, "^"): track.carts.insert(Cart(position: p, heading: .north))
                case (_, ">"): track.carts.insert(Cart(position: p, heading: .east))
                case (_, "v"): track.carts.insert(Cart(position: p, heading: .south))
                case (_, "<"): track.carts.insert(Cart(position: p, heading: .west))
                default: break
                }
                prev = char
            }
        }
        return track
    }
    
    func updateTrack(track: inout Track, stopOnCrash: Bool = true) throws {
        for var cart in track.carts.sorted(by: { $0.position < $1.position }) {
            guard track.carts.remove(cart) != nil else {
                continue
            }
            
            cart.position = cart.position.moved(cart.heading)
            
            switch track.pieces[cart.position] {
            case .some(.corner(let d1, let d2)) where d1 == cart.heading.opposite:
                cart.heading = d2
            case .some(.corner(let d1, let d2)) where d2 == cart.heading.opposite:
                cart.heading = d1
            case .some(.intersection):
                cart.handleIntersection()
            default: break
            }
            
            if track.carts.contains(cart) {
                track.carts.remove(cart)
                
                if stopOnCrash {
                    throw Track.Error.crash(cart.position)
                }
            } else {
                track.carts.insert(cart)
            }
        }
    }
    
    public func part1Solution(for input: Input) -> String {
        var track = parseTrack(input)
        
//        let map = input
//            .replacingOccurrences(of: ">", with: "-")
//            .replacingOccurrences(of: "<", with: "-")
//            .replacingOccurrences(of: "^", with: "|")
//            .replacingOccurrences(of: "v", with: "|")
//            .components(separatedBy: "\n")
//            .map { l in Array(l.map { String($0) }) }
        
        while true {
            do {
                try updateTrack(track: &track)
//                track.print(on: map)
            } catch Track.Error.crash(let p) {
                return "\(p.x),\(p.y)"
            } catch {
                return "UNKNOWN"
            }
        }
    }

    public func part2Solution(for input: Input) -> String {
        var track = parseTrack(input)
        
//        let map = input
//            .replacingOccurrences(of: ">", with: "-")
//            .replacingOccurrences(of: "<", with: "-")
//            .replacingOccurrences(of: "^", with: "|")
//            .replacingOccurrences(of: "v", with: "|")
//            .components(separatedBy: "\n")
//            .map { l in Array(l.map { String($0) }) }
        
        while track.carts.count > 1 {
            try? updateTrack(track: &track, stopOnCrash: false)
//            track.print(on: map)
        }
        
        let p = track.carts.first!.position
        return "\(p.x),\(p.y)"
    }
}
