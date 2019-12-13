import Foundation

public struct Permutations<C: Collection>: Sequence, IteratorProtocol where C.Index == Int {
    var collection: [C.Element]
    let collectionCount: Int

    //c is an encoding of the stack state. c[k] encodes the for-loop counter for when generate(k+1, A) is called
    private var c: [Int]

    // The index of the loop,
    // -1 inticates its the first time through so it should output the starting collection
    private var index = -1

    public init(from collection: C) {
        self.collection = Array(collection)
        self.collectionCount = collection.count
        
        self.c = Array(repeating: 0, count: collection.count)
    }
    
    mutating public func next() -> [C.Element]? {
        guard index >= 0 else {
            index = 0
            return collection
        }
        
        while index < collectionCount {
            if c[index] < index {
                if index.isMultiple(of: 2) {
                    collection.swapAt(0, index)
                } else {
                    collection.swapAt(c[index], index)
                }
                
                c[index] += 1
                index = 0
                return collection
            } else {
                c[index] = 0
                index += 1
            }
        }
        
        return nil
    }
}
